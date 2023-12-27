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
        private readonly ICustomerFirmTransportSetting _customerFirmTransportSettingRepository;
        private readonly ITransportLRCharges _transportLRChargesRepository;
        private readonly ITransportLRBranchCityMapping _transportLRBranchCityMappingRepository;
        private readonly ILRBooking _lrBookingRepository;
        private readonly ITransportLRDelivery _transportLRDeliveryRepository;
        private readonly ICustomerInvoice _customerInvoice;
        private readonly ITransportLRDeliveryType _transportLRDeliveryTypeRepository;
        private readonly IChalan _chalanRepository;
        private readonly IChalanReceive _chalanReceiveRepository;
        private readonly ILRBookingLRRegister _lrBookingLRRegisterRepository;

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
            ITransportLRPayType transportLRPayTypeRepository,
            ICustomerAccountBranchMapping customerAccountBranchMapping,
            ITransportLRBranchCityMapping transportLRBranchCityMappingRepository,
            ICustomerBook customerBookRepository,
            IBookTypeAdmin bookTypeRepository,
            IBillTypeAdmin billTypeAdminRepository,
            ISalesBillFromAdmin salesBillFromAdminRepository,
            ICustomerFirmBranchTransportSetting customerFirmBranchTransportSettingRepository,
            ITransportLRRateOn transportLRRateOnRepository,
            ICustomerFirmTransportSetting customerFirmTransportSettingRepository,
            ITransportLRCharges transportLRChargesRepository,
            ILRBooking lrBookingRepository,
            ITransportLRDelivery transportLRDeliveryRepository,
            ICustomerInvoice customerInvoice,
            ITransportLRDeliveryType transportLRDeliveryTypeRepository,
            IChalan chalanRepository,
            IChalanReceive chalanReceiveRepository,
            ILRBookingLRRegister lrBookingLRRegisterRepository)
            : base(loginHandler, userRepository, configurationData)
        {
            _vehicleRepo = vehicleRepo;
            _commonRepository = commonRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
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
            _customerBookRepository = customerBookRepository;
            _bookTypeRepository = bookTypeRepository;
            _billTypeAdminRepository = billTypeAdminRepository;
            _salesBillFromAdminRepository = salesBillFromAdminRepository;
            _customerFirmBranchTransportSettingRepository = customerFirmBranchTransportSettingRepository;
            _transportLRRateOnRepository = transportLRRateOnRepository;
            _customerFirmTransportSettingRepository = customerFirmTransportSettingRepository;
            _transportLRChargesRepository = transportLRChargesRepository;
            _lrBookingRepository = lrBookingRepository;
            _transportLRDeliveryRepository = transportLRDeliveryRepository;
            _customerInvoice = customerInvoice;
            _transportLRDeliveryTypeRepository = transportLRDeliveryTypeRepository;
            _chalanRepository = chalanRepository;
            _chalanReceiveRepository = chalanReceiveRepository;
            _lrBookingLRRegisterRepository = lrBookingLRRegisterRepository;
        }


    }
}
