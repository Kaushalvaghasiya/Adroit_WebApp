using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class RegistrationController : MasterController
    {
        private readonly ICustomer _customerRepo;
        private readonly IState _stateRepo;
        private readonly ICity _cityRepo;
        private readonly ICountry _countryRepo;
        private readonly IBusiness _businessRepo;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<RegistrationController> _logger;
        private readonly IEmailService _emailService;
        public RegistrationController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData, 
            ICustomer customerRepo, 
            IState stateRepo, 
            ICity cityRepo,
            ICountry countryRepo,
            IBusiness businessRepo, 
            UserManager<IdentityUser> userManager, 
            IUserStore<IdentityUser> userStore,
            ILogger<RegistrationController> logger,
            IEmailService emailService)
            : base(loginHandler, userRepository, configurationData)
        {
            _customerRepo = customerRepo;
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _emailService = emailService;
            _countryRepo = countryRepo;
            _businessRepo = businessRepo;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _logger = logger;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            RegistrationViewModel model = new RegistrationViewModel();
            model.CountryList = _countryRepo.SelectList(_configurationData.DefaultConnection).ToList();
            model.BusinessList = _businessRepo.SelectList(_configurationData.DefaultConnection).ToList();

            return View(model);
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<JsonResult> Save([FromBody] RegistrationViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = await Common.RegisterCustomer(_userManager, _userStore, _emailStore, _emailService, _configurationData, Request, _logger, _customerRepo,
                    new Customer()
                    {
                        Name = model.Name,
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
                    });
                if (data.id > 0)
                {
                    result.data = data.id;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
                else
                {
                    throw new Exception(data.error);
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "RegistrationController.Save");
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }

            return Json(result);
        }

        [AllowAnonymous]
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

        [AllowAnonymous]
        private IUserEmailStore<IdentityUser> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)_userStore;
        }

        [AllowAnonymous]
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
                _logger.LogError(ex, "RegistrationController.EmailExists");
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}