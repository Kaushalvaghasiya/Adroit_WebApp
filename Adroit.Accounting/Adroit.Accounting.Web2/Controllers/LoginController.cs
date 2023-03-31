using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web2.Utility;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

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
        public LoginController(
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            SignInManager<IdentityUser> signInManager,
            ILogger<LoginController> logger,
            IOptions<ConfigurationData> configurationData,
            IUser userRepository,
            ICustomer customerRepository)
        {
            _userManager = userManager;
            _userStore = userStore;
            _signInManager = signInManager;
            _logger = logger;
            _configurationData = configurationData.Value;
            _userRepository = userRepository;
            _customerRepository = customerRepository;
        }
        public async Task<IActionResult> Index()
        {
            // Clear the existing external cookie to ensure a clean login process
            //await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return View();
        }

        [HttpPost]
        [AllowAnonymous]
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

                    //Get userdetails from CustomerUser table using above user.Id object.
                    var userDetail = _userRepository.Get(model.Username, _configurationData.DefaultConnection);
                    var customer = _customerRepository.Get(userDetail.CustomerId, _configurationData.DefaultConnection);

                    await LoginHandler.SetupLogin(HttpContext, 
                        model.Username, 
                        $"{userDetail.FirstName} {userDetail.LastName}", 
                        customer.CustomerType == Model.Enums.CustomerType.BackOffice ? Utility.UserType.BackOffice : Utility.UserType.Customer
                        ).ConfigureAwait(false);

                    _logger.LogInformation("User logged in using membership provider.");

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
