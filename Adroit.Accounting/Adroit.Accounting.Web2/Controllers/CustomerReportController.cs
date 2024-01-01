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
        private readonly IReportLRBookingLRRegister _reportLRBookingLRRegisterRepository;
        private readonly IReportLRBookingStockRegister _reportLRBookingStockRegisterRepository;
        private readonly IReportLRBookingBookingRegister _reportLRBookingBookingRegisterRepository;
        private readonly IReportLRBookingChalanLoadingReport _reportLRBookingChalanLoadingReportRepository;
        private readonly IReportLRBookingMonthlySummary _reportLRBookingMonthlySummaryRepository;
        private readonly IReportLRBookingDailySummary _reportLRBookingDailySummaryRepository;
        private readonly ICustomerBook _customerBookRepository;
        private readonly ICustomerAccount _customerAccountRepo;
        protected readonly ICustomerBrokerBranchMapping _customerBrokerBranchMappingRepo;
        private readonly IProductGroup _productGroupRepository;
        private readonly IProductSubGroup _productSubGroupRepository;
        private readonly IProductDesignNumber _productDesignNumberRepository;
        private readonly IProductColor _productColorRepository;
        private readonly ITransportDesc _transportDescRepository;
        private readonly IGSTRate _gstRateRepository;

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
            IReportLRBookingLRRegister reportLRBookingLRRegisterRepository,
            IReportLRBookingStockRegister reportLRBookingStockRegisterRepository,
            IReportLRBookingBookingRegister reportLRBookingBookingRegisterRepository,
            IReportLRBookingChalanLoadingReport reportLRBookingChalanLoadingReportRepository,
            IReportLRBookingMonthlySummary reportLRBookingMonthlySummaryRepository,
            IReportLRBookingDailySummary reportLRBookingDailySummaryRepository,
            ICustomerBook customerBookRepository,
            ICustomerAccount customerAccountRepo,
            ICustomerBrokerBranchMapping customerBrokerBranchMappingRepo,
            IProductGroup productGroupRepository,
            IProductSubGroup productSubGroupRepository,
            IProductDesignNumber productDesignNumberRepository,
            IProductColor productColorRepository,
            ITransportDesc transportDescRepository, 
            IGSTRate gstRateRepository)
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
            _transportLRDeliveryTypeRepository = transportLRDeliveryTypeRepository;
            _chalanRepository = chalanRepository;
            _reportLRBookingLRRegisterRepository = reportLRBookingLRRegisterRepository;
            _reportLRBookingStockRegisterRepository = reportLRBookingStockRegisterRepository;
            _reportLRBookingBookingRegisterRepository = reportLRBookingBookingRegisterRepository;
            _reportLRBookingChalanLoadingReportRepository = reportLRBookingChalanLoadingReportRepository;
            _reportLRBookingMonthlySummaryRepository = reportLRBookingMonthlySummaryRepository;
            _reportLRBookingDailySummaryRepository = reportLRBookingDailySummaryRepository;
            _customerBookRepository = customerBookRepository;
            _customerAccountRepo = customerAccountRepo;
            _customerBrokerBranchMappingRepo = customerBrokerBranchMappingRepo;
            _productGroupRepository = productGroupRepository;
            _productSubGroupRepository = productSubGroupRepository;
            _productDesignNumberRepository = productDesignNumberRepository;
            _productColorRepository = productColorRepository;
            _transportDescRepository = transportDescRepository;
            _gstRateRepository = gstRateRepository;
        }
    }
}
