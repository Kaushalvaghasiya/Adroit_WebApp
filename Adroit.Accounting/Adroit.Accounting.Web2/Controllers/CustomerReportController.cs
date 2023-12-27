using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
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
    public partial class CustomerReportController : MasterController
    {
        //protected readonly IVehicle _vehicleRepo;
        private readonly ICommon _commonRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        private readonly ICity _cityRepository;
        private readonly IVehicle _vehicleRepo;
        private readonly ITransportLRPayType _transportLRPayTypeRepository;
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
        private readonly ITransportLRDeliveryType _transportLRDeliveryTypeRepository;
        private readonly IChalan _chalanRepository;
        private readonly IChalanReceive _chalanReceiveRepository;
        private readonly ILRBookingRenew _lrBookingRenewRepository;
        private readonly IStockRegister _stockRegisterRepository;

        public CustomerReportController(
            ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            IVehicle vehicleRepo,
            IVehicleModel vehicleModelRepository,
            ICountry countryRepository,
            IVehicleOwner vehicleOwnerRepo,
            ICustomerAccount customerAccountRepo,
            ICustomerBrokerBranchMapping customerBrokerBranchMappingRepo,
            ICustomerAccountGroup customerAccountGroupRepo,
            ICommon commonRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            ICity cityRepository,
            IVehicle vehicleRepo,
            ITransportLRPayType transportLRPayTypeRepository,
            ICustomerAccountBranchMapping customerAccountBranchMapping,
            ITransportLRBranchCityMapping transportLRBranchCityMappingRepository

            )
            : base(loginHandler, userRepository, configurationData)
        {
            _vehicleRepo = vehicleRepo;
            _vehicleModelRepository = vehicleModelRepository;
            _countryRepository = countryRepository;
            _vehicleOwnerRepo = vehicleOwnerRepo;
            _customerAccountRepo = customerAccountRepo;
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
            //_emailStore = GetEmailStore();
            _logger = logger;
            _cityRepository = cityRepository;
            _vehicleRepo = vehicleRepo;
            _transportLRPayTypeRepository = transportLRPayTypeRepository;
            _customerAccountBranchMapping = customerAccountBranchMapping;
            _transportLRBranchCityMappingRepository = transportLRBranchCityMappingRepository;
            _lrBookingRepository = lrBookingRepository;
            _transportLRDeliveryTypeRepository = transportLRDeliveryTypeRepository;
            _transportLRDeliveryRepository = transportLRDeliveryRepository;
            _chalanRepository = chalanRepository;
            _customerInvoice = customerInvoice;
            _chalanReceiveRepository = chalanReceiveRepository;
            _lrBookingRenewRepository = lrBookingRenewRepository;
            _stockRegisterRepository = stockRegisterRepository;
    }


    }
}
