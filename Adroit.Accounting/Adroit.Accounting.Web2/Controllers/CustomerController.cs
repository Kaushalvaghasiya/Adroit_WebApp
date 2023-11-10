﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
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
        protected readonly IAdminCustomerFirm _customerFirmRepository;
        private readonly ICommon _commonRepository;
        private readonly ITransportDesc _transportDescRepository;
        private readonly IProductSize _productSizeRepository;
        private readonly IProductColor _productColorRepository;
        private readonly IProductFabric _productFabricRepository;
        private readonly IProductGroup _productGroupRepository;
        private readonly IProductSubGroup _productSubGroupRepository;
        private readonly IProductDesignNumber _productDesignNumberRepository;
        private readonly ITransportPacking _transportpackingRepository;
        private readonly IBroker _brokerRepository;
        private readonly IDriver _driverRepository;
        private readonly ICustomerFirmBranchTransportContractRateSetting _customerFirmBranchTransportContractRateSettingRepository;
        private readonly IDriverTypeAdmin _driverTypeAdmin;
        private readonly ICustomerAccountGroupHeader _customerAccountGroupHeader;
        private readonly IAccountGroupType _accountGroupType;
        protected readonly IProductShadeNumber _productShadeNumberRepository;
        private readonly IProductPacking _productPackingRepository;
        private readonly ICustomerFirm _customerFirmsRepository;
        private readonly IBusiness _businessRepository;
        private readonly IGSTFirmType _gSTFirmTypeRepository;
        private readonly IFirmType _firmTypeRepository;
        protected readonly IAdminCustomerFirmBranch _customerFirmBranchRepository;
        protected readonly ICustomerUser _customerUsersRepository;
        private readonly IEmailService _emailService;
        private readonly IUser _userRepository;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<CustomerController> _logger;
        private readonly ICity _cityRepository;
        private readonly ICustomerFirmBranch _customerFirmBranchesRepository;
        private readonly ILRBookingRange _lrBookingRangeRepository;
        private readonly ISoftwarePlan _softwarePlanRepository;
        private readonly IBranchTypeAdmin _branchTypeRepository;
        private readonly ICustomerFirmBranchLRRate _customerFirmBranchLRRateRepository;
        private readonly IProduct _productRepository;
        private readonly IProductStockType _stockTypeRepository;
        private readonly IProductQualityType _productQualityTypeRepository;
        private readonly ISoftware _softwareRepository;
        private readonly IGSTRate _gstRateRepository;
        private readonly IProductCategory _productCategoryRepository;
        private readonly IGSTUQC _gstUQCRepository;
        private readonly IGSTCalculation _gstCalculationRepository;
        private readonly IProductAmtCalcOn _productAmtCalcOnRepository;
        private readonly ICustomerAccountBranchMapping _customerAccountBranchMapping;
        private readonly ICustomerBook _customerBookRepository;
        private readonly IBookTypeAdmin _bookTypeRepository;
        protected readonly IBillTypeAdmin _billTypeAdminRepository;
        protected readonly ISalesBillFromAdmin _salesBillFromAdminRepository;
        

        public CustomerController(
            IVehicle vehicleRepo,
            IVehicleModel vehicleModelRepository,
            ICountry countryRepository,
            IVehicleOwner vehicleOwnerRepo,
            ICustomerAccount customerAccountRepo,
            IOptions<ConfigurationData> configurationData,
            ICustomerBrokerBranchMapping customerBrokerBranchMappingRepo,
            ICustomerAccountGroup customerAccountGroupRepo,
            IAdminCustomerUser customerUserRepository,
            ICommon commonRepository,
            ITransportDesc transportDescRepository,
            IProductSize productSizeRepository,
            IProductColor productColorRepository,
            IProductFabric productFabricRepository,
            IProductGroup productGroupRepository,
            IProductSubGroup productSubGroupRepository,
            IProductDesignNumber productDesignNumberRepository,
            ITransportPacking transportpackingRepository,
            IBroker brokerRepository,
            IDriver driverRepository,
            ICustomerFirmBranchTransportContractRateSetting customerFirmBranchTransportContractRateSettingRepository,
            IDriverTypeAdmin driverTypeAdmin,
            ICustomerAccountGroupHeader customerAccountGroupHeader,
            IAccountGroupType accountGroupType,
            IProductShadeNumber productShadeNumberRepository,
            IProductPacking productPackingRepository,
            ICustomerFirm customerFirmsRepository,
            ICustomer customerRepository,
            IBusiness businessRepository,
            IGSTFirmType gSTFirmTypeRepository,
            IFirmType firmTypeRepository,
            IAdminCustomerFirmBranch customerFirmBranchRepository,
            ICustomerUser customerUsersRepository,
            IEmailService emailService,
            IUser userRepository,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ILogger<CustomerController> logger,
            ICity cityRepository,
            ICustomerFirmBranch customerFirmBranchesRepository,
            ILRBookingRange lrBookingRangeRepository,
            IAdminCustomerFirm customerFirmRepository,
            ISoftwarePlan softwarePlanRepository,
            IBranchTypeAdmin branchTypeRepository,
            ICustomerFirmBranchLRRate customerFirmBranchLRRateRepository,
            IProduct productRepository,
            IProductStockType stockTypeRepository,
            IProductQualityType productQualityTypeRepository,
            ISoftware softwareRepository,
            IGSTRate gstRateRepository,
            IProductCategory productCategoryRepository,
            IGSTUQC gstUQCRepository,
            IGSTCalculation gstCalculationRepository,
            IProductAmtCalcOn productAmtCalcOnRepository,
            ICustomerAccountBranchMapping customerAccountBranchMapping,
            ICustomerBook customerBookRepository,
            IBookTypeAdmin bookTypeRepository,
            IBillTypeAdmin billTypeAdminRepository,
            ISalesBillFromAdmin salesBillFromAdminRepository)
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
            _productSizeRepository = productSizeRepository;
            _productColorRepository = productColorRepository;
            _productFabricRepository = productFabricRepository;
            _productGroupRepository = productGroupRepository;
            _productSubGroupRepository = productSubGroupRepository;
            _productDesignNumberRepository = productDesignNumberRepository;
            _transportpackingRepository = transportpackingRepository;
            _brokerRepository = brokerRepository;
            _driverRepository = driverRepository;
            _customerFirmBranchTransportContractRateSettingRepository = customerFirmBranchTransportContractRateSettingRepository;
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
            _userRepository = userRepository;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _logger = logger;
            _cityRepository = cityRepository;
            _customerFirmBranchesRepository = customerFirmBranchesRepository;
            _lrBookingRangeRepository = lrBookingRangeRepository;
            _customerFirmRepository = customerFirmRepository;
            _softwarePlanRepository = softwarePlanRepository;
            _branchTypeRepository = branchTypeRepository;
            _customerFirmBranchLRRateRepository = customerFirmBranchLRRateRepository;
            _productRepository = productRepository;
            _stockTypeRepository = stockTypeRepository;
            _productQualityTypeRepository = productQualityTypeRepository;
            _softwareRepository = softwareRepository;
            _gstRateRepository = gstRateRepository;
            _productCategoryRepository = productCategoryRepository;
            _gstUQCRepository = gstUQCRepository;
            _gstCalculationRepository = gstCalculationRepository;
            _productAmtCalcOnRepository = productAmtCalcOnRepository;
            _customerAccountBranchMapping = customerAccountBranchMapping;
            _customerBookRepository = customerBookRepository;
            _bookTypeRepository = bookTypeRepository;
            _billTypeAdminRepository = billTypeAdminRepository;
            _salesBillFromAdminRepository = salesBillFromAdminRepository;
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
