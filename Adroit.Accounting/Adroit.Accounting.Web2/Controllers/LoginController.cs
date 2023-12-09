using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly ILogger<LoginController> _logger;
        private readonly ConfigurationData _configurationData;
        private readonly IUser _userRepository;
        private readonly ICustomer _customerRepository;
        private readonly ILoginHandler _loginHandler;
        public LoginController(
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            SignInManager<IdentityUser> signInManager,
            ILogger<LoginController> logger,
            IOptions<ConfigurationData> configurationData,
            IUser userRepository,
            ICustomer customerRepository,
            ILoginHandler loginHandler)
        {
            _userManager = userManager;
            _userStore = userStore;
            _signInManager = signInManager;
            _logger = logger;
            _configurationData = configurationData.Value;
            _userRepository = userRepository;
            _customerRepository = customerRepository;
            _loginHandler = loginHandler;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            if (User?.Identity?.IsAuthenticated ?? false)
            {
                return LocalRedirect($"~/");
            }

            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Index(Model.Login model, string? returnUrl = "")
        {
            returnUrl ??= Url.Content("~/");

            //ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            if (ModelState.IsValid)
            {
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
                var result = await _signInManager.PasswordSignInAsync(model.Username, model.Password, false, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    var user = await _userManager.FindByEmailAsync(model.Username);
                    //var role = (await _userManager.GetRolesAsync(user)).FirstOrDefault() ?? "";

                    try
                    {
                        //Get userdetails from CustomerUser table using above user.Id object.
                        var userDetail = _userRepository.Get(model.Username, _configurationData.DefaultConnection);
                        var customer = _customerRepository.Get(userDetail.CustomerId, _configurationData.DefaultConnection);

                        await _loginHandler.SetupLogin(HttpContext, userDetail.ID,
                            model.Username,
                            $"{userDetail.FirstName} {userDetail.LastName}",
                            customer.CustomerType == Model.Enums.CustomerType.BackOffice ? UserType.BackOffice : UserType.Customer
                            ).ConfigureAwait(false);

                        _logger.LogInformation("User logged in using membership provider.");
                    }
                    catch (Exception ex)
                    {
                    }
                    return LocalRedirect($"~/");
                }
                else
                {
                    ModelState.AddModelError("LoginError", "You have entered an invalid username or password.");
                    return View();
                }
            }

            // If we got this far, something failed, redisplay form
            return View();
        }
    }
}
