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
        private readonly ICommon _commonRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        private readonly ICity _cityRepository;
        private readonly IVehicle _vehicleRepo;
        private readonly ITransportLRPayType _transportLRPayTypeRepository;
        private readonly ICustomerAccountBranchMapping _customerAccountBranchMapping;
        private readonly ITransportLRBranchCityMapping _transportLRBranchCityMappingRepository;
        private readonly ITransportLRDeliveryType _transportLRDeliveryTypeRepository;
        private readonly IChalan _chalanRepository;
        private readonly IReportLRBookingLRRegister _lrReportBookingLRRegisterRepository;
        private readonly IReportLRBookingLRRegister _reportLRBookingLRRegisterRepository;
        private readonly IReportLRBookingStockRegister _reportLRBookingStockRegisterRepository;

        public CustomerReportController(
            ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            ICommon commonRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            ICity cityRepository,
            IVehicle vehicleRepo,
            ITransportLRPayType transportLRPayTypeRepository,
            ICustomerAccountBranchMapping customerAccountBranchMapping,
            ITransportLRBranchCityMapping transportLRBranchCityMappingRepository,
            ITransportLRDeliveryType transportLRDeliveryTypeRepository,
            IChalan chalanRepository,            
            IReportLRBookingLRRegister lrReportBookingLRRegisterRepository,
            IReportLRBookingLRRegister reportLRBookingLRRegisterRepository,
            IReportLRBookingStockRegister reportLRBookingStockRegisterRepository
        ) : base(loginHandler, userRepository, configurationData)
        {
            _commonRepository = commonRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _cityRepository = cityRepository;
            _vehicleRepo = vehicleRepo;
            _transportLRPayTypeRepository = transportLRPayTypeRepository;
            _customerAccountBranchMapping = customerAccountBranchMapping;
            _transportLRBranchCityMappingRepository = transportLRBranchCityMappingRepository;
            _transportLRDeliveryTypeRepository = transportLRDeliveryTypeRepository;
            _chalanRepository = chalanRepository;
            _lrReportBookingLRRegisterRepository = lrReportBookingLRRegisterRepository;
            _reportLRBookingLRRegisterRepository = reportLRBookingLRRegisterRepository;
            _reportLRBookingStockRegisterRepository = reportLRBookingStockRegisterRepository;
        }
    }
}
