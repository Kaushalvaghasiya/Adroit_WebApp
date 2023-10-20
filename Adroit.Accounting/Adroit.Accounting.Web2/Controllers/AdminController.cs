using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        protected readonly IBookAdmin _bookAdminRepository;
        protected readonly IAccountAdmin _accountAdminRepository;
        protected readonly ICustomer _customerRepository;
        protected readonly IBillTypeAdmin _billTypeAdminRepository;
        protected readonly IBillEntryTypeAdmin _billEntryTypeAdminRepository;
        protected readonly ConfigurationData _configurationData;
        protected readonly ICustomerFirm _customerFirmRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        protected readonly ICustomerUser _customerUserRepository;
        private readonly IEmailService _emailService;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ISoftware _softwareRepository;
        private readonly ISoftwarePlan _softwarePlanRepository;
        private readonly ICommon _commonRepository;
        private readonly IColor _colorRepository;
        private readonly IProductSizeAdmin _productSizeRepository;
        private readonly IProductAmtCalcOn _productAmtCalcOnRepository;
        private readonly IProductStockType _productStockTypeRepository;
        private readonly IProductQualityType _productQualityTypeRepository;
        private readonly IBusiness _businessRepository;
        private readonly ICountry _countryRepository;
        private readonly IGSTFirmType _gSTFirmTypeRepository;
        private readonly IFirmType _firmTypeRepository;
        private readonly IBranchTypeAdmin _branchTypeRepository;
        private readonly ILogger<AdminController> _logger;
        private readonly IMenuSetting _menuSettingRepository;
        private readonly IBoxSetting _boxSettingRepository;
        private readonly IState _stateRepository;
        private readonly ITaluka _talukaRepository;
        private readonly ICity _cityRepository;
        private readonly IDistrict _districtRepository;
        private readonly IBookTypeAdmin _bookTypeRepository;
        private readonly IGSTRate _gstRateRepository;
        private readonly IGSTInvoiceType _gstInvoiceTypeRepository;
        private readonly IGSTPort _gstPortRepository;
        private readonly ITransportPackingAdmin _transportPackingAdminRepository;
        private readonly ISalesBillFromAdmin _salesBillFromAdminRepository;
        private readonly ITransportDescAdmin _transportDescAdminRepository;
        
        public AdminController(
            IOptions<ConfigurationData> configurationData,
            IBookAdmin bookAdminRepository,
            IAccountAdmin accountAdminRepository,
            IBillTypeAdmin billTypeAdminRepository,
            IBillEntryTypeAdmin billEntryTypeAdminRepository,
            ICustomer customerRepository,
            ICustomerFirm customerFirmRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            ICustomerUser customerUserRepository,
            IEmailService emailService,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ISoftware softwareRepository,
            ISoftwarePlan softwarePlanRepository,
            ICommon commonRepository,
            IColor colorReposotory,
            IProductSizeAdmin productSizeRepository,
            IProductAmtCalcOn productAmtCalcOnRepository,
            IProductStockType productStockTypeRepository,
            IProductQualityType productQualityTypeRepository,
            IBusiness businessRepository,
            ICountry countryRepository,
            IGSTFirmType gSTFirmTypeRepository,
            IFirmType firmTypeRepository,
            IBranchTypeAdmin branchTypeRepository,
            ILogger<AdminController> logger,
            IMenuSetting menuSettingRepository,
            IBoxSetting boxSettingRepository,
            IState stateRepository,
            ITaluka talukaRepository,
            ICity cityRepository,
            IDistrict districtRepository,
            IBookTypeAdmin bookTypeRepository,
            IGSTRate gstRateRepository,
            IGSTInvoiceType gstInvoiceTypeRepository,
            IGSTPort gstPortRepository,
            ITransportPackingAdmin transportPackingAdminRepository,
            ISalesBillFromAdmin salesBillFromAdminRepository,
            ITransportDescAdmin transportDescAdminRepository)

        {
            _configurationData = configurationData.Value;
            _bookAdminRepository = bookAdminRepository;
            _accountAdminRepository = accountAdminRepository;
            _customerRepository = customerRepository;
            _billTypeAdminRepository = billTypeAdminRepository;
            _billEntryTypeAdminRepository = billEntryTypeAdminRepository;
            _customerFirmRepository = customerFirmRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _customerUserRepository = customerUserRepository;
            _userManager = userManager;
            _emailService = emailService;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _softwareRepository = softwareRepository;
            _softwarePlanRepository = softwarePlanRepository;
            _commonRepository = commonRepository;
            _colorRepository = colorReposotory;
            _productSizeRepository = productSizeRepository;
            _productAmtCalcOnRepository = productAmtCalcOnRepository;
            _productStockTypeRepository = productStockTypeRepository;
            _productQualityTypeRepository = productQualityTypeRepository;
            _businessRepository = businessRepository;
            _countryRepository = countryRepository;
            _gSTFirmTypeRepository = gSTFirmTypeRepository;
            _firmTypeRepository = firmTypeRepository;
            _branchTypeRepository = branchTypeRepository;
            _logger = logger;
            _menuSettingRepository = menuSettingRepository;
            _boxSettingRepository = boxSettingRepository;
            _stateRepository = stateRepository;
            _talukaRepository = talukaRepository;
            _districtRepository = districtRepository;
            _cityRepository = cityRepository;
            _bookTypeRepository = bookTypeRepository;
            _gstRateRepository = gstRateRepository;
            _gstInvoiceTypeRepository = gstInvoiceTypeRepository;
            _gstPortRepository = gstPortRepository;
            _transportPackingAdminRepository = transportPackingAdminRepository;
            _salesBillFromAdminRepository = salesBillFromAdminRepository;
            _transportDescAdminRepository = transportDescAdminRepository;
        }
    }
}