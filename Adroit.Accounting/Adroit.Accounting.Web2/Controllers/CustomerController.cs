using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        protected readonly IVehicle _vehicleRepo;
        protected readonly IVehicleModel _vehicleModelRepository;
        protected readonly ICountry _countryRepository;
        protected readonly IVehicleOwner _vehicleOwnerRepo;
        protected readonly ICustomerAccount _customerAccountRepo;
        protected readonly ICustomerAccountOpeningBalance _customerAccountOpeningBalanceRepo;
        protected readonly ICustomerBrokerBranchMapping _customerBrokerBranchMappingRepo;
        protected readonly ICustomerAccountGroup _customerAccountGroupRepo;
        protected readonly ICustomer _customerRepository;
        protected readonly IAdminCustomerFirm _adminCustomerFirmRepository;
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
        private readonly ICustomerFirm _customerFirmRepository;
        private readonly IBusiness _businessRepository;
        private readonly IGSTFirmType _gSTFirmTypeRepository;
        private readonly IFirmType _firmTypeRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        protected readonly ICustomerUser _customerUsersRepository;
        private readonly IEmailService _emailService;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<CustomerController> _logger;
        private readonly ICity _cityRepository;
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
        protected readonly ICustomerFirmBranchTransportSetting _customerFirmBranchTransportSettingRepository;
        protected readonly ITransportLRRateOn _transportLRRateOnRepository;
        protected readonly ITransportLRPayType _transportLRPayTypeRepository;
        private readonly ICustomerFirmTransportSetting _customerFirmTransportSettingRepository;
        private readonly ITransportLRCharges _transportLRChargesRepository;
        private readonly ITransportLRBranchCityMapping _transportLRBranchCityMappingRepository;
        private readonly ILRBooking _lrBookingRepository;
        private readonly ITransportLRDelivery _transportLRDeliveryRepository;
        private readonly ICustomerInvoice _customerInvoice;
        private readonly ICustomerDeliveryInvoice _customerDeliveryInvoice;
        private readonly ITransportLRDeliveryType _transportLRDeliveryTypeRepository;
        private readonly IChalan _chalanRepository;
        private readonly IChalanReceive _chalanReceiveRepository;
        private readonly ILRBookingRangeRenew _lrBookingRangeRenewRepository;
        private readonly ICustomerGeneralExpensesMulti _customerGeneralExpensesMultiRepository;
        private readonly ICustomerPurchaseGeneralInvoice _customerPurchaseGeneralInvoiceRepository;
        private readonly IChalanReceiveAgency _chalanReceiveAgency;
        private IGSTInvoiceType _gstInvoiceTypeRepository;
        private readonly ISalesBillMaster _salesBillMaster;
        public CustomerController(
            ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            IVehicle vehicleRepo,
            IVehicleModel vehicleModelRepository,
            ICountry countryRepository,
            IVehicleOwner vehicleOwnerRepo,
            ICustomerAccount customerAccountRepo,
            ICustomerAccountOpeningBalance customerAccountOpeningBalanceRepo,
            ICustomerBrokerBranchMapping customerBrokerBranchMappingRepo,
            ICustomerAccountGroup customerAccountGroupRepo,
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
            ICustomerFirmBranch customerFirmBranchRepository,
            ICustomerUser customerUsersRepository,
            IEmailService emailService,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ILogger<CustomerController> logger,
            ICity cityRepository,
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
            ISalesBillFromAdmin salesBillFromAdminRepository,
            ICustomerFirmBranchTransportSetting customerFirmBranchTransportSettingRepository,
            ITransportLRRateOn transportLRRateOnRepository,
            ITransportLRPayType transportLRPayTypeRepository,
            ICustomerFirmTransportSetting customerFirmTransportSettingRepository,
            ITransportLRCharges transportLRChargesRepository,
            ITransportLRBranchCityMapping transportLRBranchCityMappingRepository,
            ILRBooking lrBookingRepository,
            ITransportLRDeliveryType transportLRDeliveryTypeRepository,
            ITransportLRDelivery transportLRDeliveryRepository,
            IChalan chalanRepository,
            ICustomerInvoice customerInvoice,
            ICustomerDeliveryInvoice customerDeliveryInvoice,
            IChalanReceive chalanReceiveRepository,
            ILRBookingRangeRenew lrBookingRangeRenewRepository, 
            ICustomerGeneralExpensesMulti customerGeneralExpensesMultiRepository,
            ICustomerPurchaseGeneralInvoice customerPurchaseGeneralInvoiceRepository,
            IChalanReceiveAgency chalanReceiveAgency,
            IGSTInvoiceType gstInvoiceTypeRepository,
            ISalesBillMaster salesBillMaster)
            : base(loginHandler, userRepository, configurationData)
        {
            _vehicleRepo = vehicleRepo;
            _vehicleModelRepository = vehicleModelRepository;
            _countryRepository = countryRepository;
            _vehicleOwnerRepo = vehicleOwnerRepo;
            _customerAccountRepo = customerAccountRepo;
            _customerAccountOpeningBalanceRepo = customerAccountOpeningBalanceRepo;
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
            _customerFirmRepository = customerFirmsRepository;
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
            _cityRepository = cityRepository;
            _lrBookingRangeRepository = lrBookingRangeRepository;
            _adminCustomerFirmRepository = customerFirmRepository;
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
            _customerFirmBranchTransportSettingRepository = customerFirmBranchTransportSettingRepository;
            _transportLRRateOnRepository = transportLRRateOnRepository;
            _transportLRPayTypeRepository = transportLRPayTypeRepository;
            _customerFirmTransportSettingRepository = customerFirmTransportSettingRepository;
            _transportLRChargesRepository = transportLRChargesRepository;
            _transportLRBranchCityMappingRepository = transportLRBranchCityMappingRepository;
            _lrBookingRepository = lrBookingRepository;
            _transportLRDeliveryTypeRepository = transportLRDeliveryTypeRepository;
            _transportLRDeliveryRepository = transportLRDeliveryRepository;
            _chalanRepository = chalanRepository;
            _customerInvoice = customerInvoice;
            _customerDeliveryInvoice = customerDeliveryInvoice;
            _chalanReceiveRepository = chalanReceiveRepository;
            _lrBookingRangeRenewRepository = lrBookingRangeRenewRepository;
            _customerGeneralExpensesMultiRepository = customerGeneralExpensesMultiRepository;
            _customerPurchaseGeneralInvoiceRepository = customerPurchaseGeneralInvoiceRepository;
            _chalanReceiveAgency = chalanReceiveAgency;
            _gstInvoiceTypeRepository = gstInvoiceTypeRepository;
            _salesBillMaster = salesBillMaster;
        }

        public JsonResult GetAccountGroups()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountGroupRepo.GetCustomerAccountGroupList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
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
                result.data = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId).ToList(); ;
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
