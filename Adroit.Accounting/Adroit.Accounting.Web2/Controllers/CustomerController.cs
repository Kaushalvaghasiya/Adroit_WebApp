using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        protected readonly IVehicle _vehicleRepo;
        protected readonly IVehicleModel _vehicleModelRepository;
        protected readonly ICountry _countryRepository;
        protected readonly IVehicleOwner _vehicleOwnerRepo;
        protected readonly ICustomerAccount _customerAccountRepo;
        protected readonly ICustomerBrokerBranchMapping _customerBrokerBranchMappingRepo;
        protected readonly ICustomerAccountGroup _customerAccountGroupRepo;
        protected readonly ConfigurationData _configurationData;
        protected readonly ICustomer _customerRepository;
        private readonly ICommon _commonRepository;
        private readonly ITransportDesc _transportDescRepository;
        private readonly IProductFabric _productFabricRepository;
        private readonly IProductSubGroup _productSubGroupRepository;
        private readonly IProductDesignNumber _productDesignNumberRepository;
        private readonly ITransportPacking _transportpackingRepository;
        private readonly IDriver _driverRepository;
        private readonly IDriverTypeAdmin _driverTypeAdmin;
        private readonly ICustomerAccountGroupHeader _customerAccountGroupHeader;
        private readonly IAccountGroupType _accountGroupType;
        protected readonly IProductShadeNumber _productShadeNumberRepository;
        private readonly IProductPacking _productPackingRepository;
        private readonly ICustomerFirms _customerFirmsRepository;
        private readonly IBusiness _businessRepository;
        private readonly IGSTFirmType _gSTFirmTypeRepository;
        private readonly IFirmType _firmTypeRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        protected readonly ICustomerUsers _customerUsersRepository;
        private readonly IEmailService _emailService;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<CustomerController> _logger;

        public CustomerController(
            IVehicle vehicleRepo,
            IVehicleModel vehicleModelRepository,
            ICountry countryRepository,
            IVehicleOwner vehicleOwnerRepo,
            ICustomerAccount customerAccountRepo,
            IOptions<ConfigurationData> configurationData,
            ICustomerBrokerBranchMapping customerBrokerBranchMappingRepo,
            ICustomerAccountGroup customerAccountGroupRepo,
            ICustomerUser customerUserRepository,
            ICommon commonRepository,
            ITransportDesc transportDescRepository,
            IProductFabric productFabricRepository,
            IProductSubGroup productSubGroupRepository,
            IProductDesignNumber productDesignNumberRepository,
            ITransportPacking transportpackingRepository,
            IDriver driverRepository,
            IDriverTypeAdmin driverTypeAdmin,
            ICustomerAccountGroupHeader customerAccountGroupHeader,
            IAccountGroupType accountGroupType,
            IProductShadeNumber productShadeNumberRepository,
            IProductPacking productPackingRepository,
            ICustomerFirms customerFirmsRepository,
            ICustomer customerRepository,
            IBusiness businessRepository,
            IGSTFirmType gSTFirmTypeRepository,
            IFirmType firmTypeRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            ICustomerUsers customerUsersRepository,
            IEmailService emailService,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ILogger<CustomerController> logger)
        {
            _vehicleRepo = vehicleRepo;
            _vehicleModelRepository = vehicleModelRepository;
            _countryRepository = countryRepository;
            _vehicleOwnerRepo = vehicleOwnerRepo;
            _customerAccountRepo = customerAccountRepo;
            _configurationData = configurationData.Value;
            _customerBrokerBranchMappingRepo = customerBrokerBranchMappingRepo;
            _customerAccountGroupRepo = customerAccountGroupRepo;
            _commonRepository = commonRepository;
            _transportDescRepository = transportDescRepository;
            _productSubGroupRepository = productSubGroupRepository;
            _productDesignNumberRepository = productDesignNumberRepository;
            _transportpackingRepository = transportpackingRepository;
            _driverRepository = driverRepository;
            _driverTypeAdmin = driverTypeAdmin;
            _customerAccountGroupHeader = customerAccountGroupHeader;
            _accountGroupType = accountGroupType;
            _productShadeNumberRepository = productShadeNumberRepository;
            _productPackingRepository = productPackingRepository;
            _customerFirmsRepository = customerFirmsRepository;
            _customerRepository = customerRepository;
            _businessRepository = businessRepository;
            _gSTFirmTypeRepository = gSTFirmTypeRepository;
            _firmTypeRepository = firmTypeRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _customerUsersRepository = customerUsersRepository;
            _emailService = emailService;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _logger = logger;
        }

        public IActionResult Account()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveAccount([FromBody] CustomerAccount model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerAccountRepo.Save(model, _configurationData.DefaultConnection);
                if (id > 0)
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

        [HttpGet]
        public JsonResult GetAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.Get(id, _configurationData.DefaultConnection, 0, 0);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetAccountList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<CustomerGridViewModel>();
            try
            {
                int sortColumn = 0, loginId = 0, firmId = 0;
                string sortDirection = "asc", search = "";

                //// note: we only sort one column at a time
                //search = Convert.ToString(Request.Query["search[value]"]);
                //sortColumn = int.Parse(Request.Query["order[0][column]"]);
                //sortDirection = Convert.ToString(Request.Query["order[0][dir]"]);

                var records = _customerAccountRepo.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public JsonResult DeleteAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.Delete(id, _configurationData.DefaultConnection, 0, 0);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetAccountGroups()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                result.data = _customerAccountGroupRepo.GetCustomerAccountGroupList(_configurationData.DefaultConnection, loginId, firmId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetBroker()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                result.data = _customerBrokerBranchMappingRepo.GetCustomerBrokerBranchMappingList(_configurationData.DefaultConnection, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetAccounts()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                result.data = _customerAccountRepo.GetCustomerAccountList(_configurationData.DefaultConnection, loginId, firmId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
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
