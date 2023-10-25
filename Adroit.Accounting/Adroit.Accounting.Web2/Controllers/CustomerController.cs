using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
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
        private readonly ICommon _commonRepository;
        private readonly ITransportDesc _transportDescRepository;
        private readonly IProductGroup _productGroupRepository;
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
            IProductGroup productGroupRepository)
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
            _productGroupRepository = productGroupRepository;
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
