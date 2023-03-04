using Adroit.Accounting.Repository;
using Adroit.Accounting.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Microsoft.Extensions.Options;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Model.Enums;
using Microsoft.AspNetCore.Identity;
using System.Text;
using Microsoft.AspNetCore.WebUtilities;
using System.Text.Encodings.Web;

namespace Adroit.Accounting.Web.Controllers
{
    public class RegistrationController : Controller
    {
        private ICustomerRepository _customerRepo;
        private IStateRepository _stateRepo;
        private ICityRepository _cityRepo;
        private ICountryRepository _countryRepo;
        private IBusinessRepository _businessRepo;
        private readonly ConfigurationData _configurationData;
        private readonly IConfiguration _configuration;
        private readonly EmailSetup _emailData;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        public RegistrationController(ICustomerRepository customerRepo, IStateRepository stateRepo, ICityRepository cityRepo,
                IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData, ICountryRepository countryRepo,
                IBusinessRepository businessRepo, IConfiguration configuration, UserManager<IdentityUser> userManager,
                IUserStore<IdentityUser> userStore)
        {
            _customerRepo = customerRepo;
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _configurationData = configurationData.Value;
            _emailData = emailData.Value;
            _countryRepo = countryRepo;
            _businessRepo = businessRepo;
            _configuration = configuration;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
        }
        public IActionResult Index()
        {
            Customer model = new Customer();
            model.Id = 0;
            ViewBag.EmptyList = new SelectList(Enumerable.Empty<SelectListItem>());

            List<Country> countries = _countryRepo.GetCountryList(_configurationData.DefaultConnection).ToList();
            ViewBag.CountryList = new SelectList(countries, "Id", "Title");
            ViewBag.CountryCodeList = new SelectList(countries, "Id", "PhoneCode");

            List<Business> businesses = _businessRepo.GetBusinessList(_configurationData.DefaultConnection).ToList();
            ViewBag.BusinessList = new SelectList(businesses, "Id", "Title");
            return View(model);
        }
        [HttpPost]
        public async Task<JsonResult> Save([FromBody] Customer model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var user = CreateUser();
                await _userStore.SetUserNameAsync(user, model.Email, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, model.Email, CancellationToken.None);
                var res = await _userManager.CreateAsync(user);
                if (res.Succeeded)
                {
                    Customer customer = _customerRepo.Get(model.Email, _configurationData.DefaultConnection);
                    if (customer == null)
                    {
                        model.EmailOtp = RandomNumber.SixDigigNumber();
                        model.MobileOtp = RandomNumber.SixDigigNumber();
                        model.StatusId = (short)CustomerStatus.Registered;
                        int id = _customerRepo.Save(model, _configurationData.DefaultConnection);
                        if (id > 0)
                        {
                            result.data = true;
                            result.result = Constant.API_RESULT_SUCCESS;
                            //send email
                            var userId = await _userManager.GetUserIdAsync(user);
                            var code = await _userManager.GeneratePasswordResetTokenAsync(user);
                            code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));

                            string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Authentication/VerifyOtpAndSetPassword?userId={userId}&code={code}";
                            var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\OTPEmail.html"));
                            msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "")
                                .Replace("{OTP}", model.EmailOtp)
                                .Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
                            await Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
                                                            _emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration OTP and Reset password", msgBody, "")).ConfigureAwait(false);
                        }
                    }
                    else
                    {
                        result.data = "Email already exists.";
                        result.result = Constant.API_RESULT_ERROR;
                    }
                }
                else
                {
                    StringBuilder errors = new StringBuilder();
                    foreach (var item in res.Errors)
                    {
                        errors.AppendLine(item.Description);
                    }
                    result.data = errors.ToString();
                    result.result = Constant.API_RESULT_ERROR;
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        private IdentityUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<IdentityUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(IdentityUser)}'. " +
                    $"Ensure that '{nameof(IdentityUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }
        private IUserEmailStore<IdentityUser> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)_userStore;
        }
        public JsonResult EmailExists(string email)
        {
            ApiResult result = new ApiResult();
            try
            {
                Customer customer = _customerRepo.Get(email, _configurationData.DefaultConnection);
                if (customer == null)
                {
                    result.data = false;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
                else
                {
                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}
