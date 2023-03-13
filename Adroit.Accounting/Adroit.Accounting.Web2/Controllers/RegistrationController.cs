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
using Adroit.Accounting.Model.ViewModel;
using static System.Net.Mime.MediaTypeNames;

namespace Adroit.Accounting.Web.Controllers
{
    public class RegistrationController : Controller
    {
        private readonly ICustomerRepository _customerRepo;
        private readonly IStateRepository _stateRepo;
        private readonly ICityRepository _cityRepo;
        private readonly ICountryRepository _countryRepo;
        private readonly IBusinessRepository _businessRepo;
        private readonly ConfigurationData _configurationData;
        private readonly EmailSetup _emailData;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<RegistrationController> _logger;
        public RegistrationController(ICustomerRepository customerRepo, IStateRepository stateRepo, ICityRepository cityRepo,
                IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData, ICountryRepository countryRepo,
                IBusinessRepository businessRepo, UserManager<IdentityUser> userManager, IUserStore<IdentityUser> userStore,
                ILogger<RegistrationController> logger)
        {
            _customerRepo = customerRepo;
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _configurationData = configurationData.Value;
            _emailData = emailData.Value;
            _countryRepo = countryRepo;
            _businessRepo = businessRepo;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _logger = logger;
        }
        public IActionResult Index()
        {
            RegistrationViewModel model = new RegistrationViewModel();
            model.CountryList = (from item in _countryRepo.GetCountryList(_configurationData.DefaultConnection).AsEnumerable()
                                 select new DropdownViewModel { Value = $"{item.Id}", Text = item.Title }).ToList();
            model.BusinessList = (from item in _businessRepo.GetBusinessList(_configurationData.DefaultConnection).AsEnumerable()
                                  select new DropdownViewModel { Value = $"{item.Id}", Text = item.Title }).ToList();

            return View(model);
        }
        [HttpPost]
        public async Task<JsonResult> Save([FromBody] RegistrationViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var user = await _userManager.FindByNameAsync(model.Email);
                if (user != null)
                {
                    throw new Exception("This email is already associated with another account, please choose different email.");
                }

                Customer customer = _customerRepo.Get(model.Email, _configurationData.DefaultConnection);
                if (customer != null)
                {
                    throw new Exception("This email is already associated with another account, please choose different email.");
                }

                user = CreateUser();
                await _userStore.SetUserNameAsync(user, model.Email, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, model.Email, CancellationToken.None);

                //Create membership user
                var res = await _userManager.CreateAsync(user);
                if (res.Succeeded)
                {
                    var userId = await _userManager.GetUserIdAsync(user);
                    customer = new Customer()
                    {
                        DefaultUserId = Guid.Parse(userId),
                        Name = model.BusinessName,
                        BusinessName = model.BusinessName,
                        BusinessId = model.BusinessId,
                        StateId = model.StateId,
                        CityId = model.CityId,
                        Mobile = model.Mobile,
                        Email = model.Email,
                        Requirement = model.Requirement ?? "",
                        AgreeTerms = model.AgreeTerms,
                        EmailOtp = RandomNumber.SixDigigNumber(),
                        MobileOtp = RandomNumber.SixDigigNumber(),
                        CustomerType = CustomerType.Inquiry,
                        StatusId = CustomerStatus.Registered,
                    };

                    int id = _customerRepo.Save(customer, _configurationData.DefaultConnection);
                    if (id > 0)
                    {
                        result.data = true;
                        result.result = Constant.API_RESULT_SUCCESS;
                        //send email
                        var code = await _userManager.GeneratePasswordResetTokenAsync(user);
                        code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));

                        string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Authentication/VerifyOtpAndSetPassword?userId={userId}&code={code}";
                        var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\OTPEmail.html"));
                        msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "")
                                                .Replace("{OTP}", customer.EmailOtp)
                                                .Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
                        await Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
                                                        _emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit IBS Account System Registration Verifiction", msgBody, "")).ConfigureAwait(false);
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
                string error = ErrorHandler.GetError(ex);
                _logger.LogError(ex, "Registration.Save");
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
