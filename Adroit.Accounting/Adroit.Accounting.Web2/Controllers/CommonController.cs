using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Authorization;
using Adroit.Accounting.Model;
using Adroit.Accounting.Web.Utility;

namespace Adroit.Accounting.Web.Controllers
{
    public class CommonController : MasterController
    {
        private IState _stateRepository;
        private ICity _cityRepository;
        private ICountry _countryRepository;
        private ITaluka _talukaRepository;
        private IDistrict _districtRepository;
        private IGSTInvoiceType _gstInvoiceTypeRepository;
        private IBusiness _businessRepository;
        private IFirmType _firmTypeRepository;
        private IGSTFirmType _gstFirmTypeRepository;
        private ISoftware _softwareRepository;
        private ISoftwarePlan _softwarePlanRepository;
        private ICustomer _customerRepository;
        private IAdminCustomerFirm _customerFirmRepository;
        private IAdminCustomerFirmBranch _customerFirmBranchRepository;
        private IAdminCustomerUser _customerUserRepository;
        private ICommon _commonRepository;
        private IGSTCollection _gstCollection;
        private IBranchTypeAdmin _branchTypeAdminRepository;
        public CommonController(
            ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            IState stateRepository,
            ICity cityRepository,
            ICountry countryRepository,
            IDistrict districtRepository,
            ITaluka talukaRepository,
            IGSTInvoiceType gstInvoiceTypeRepository,
            IBusiness businessRepository,
            ISoftware softwareRepository,
            ISoftwarePlan softwarePlanRepository,
            IFirmType firmTypeRepository,
            IGSTFirmType gstFirmTypeRepository,
            ICustomer customerRepository,
            IAdminCustomerFirm customerFirmRepository,
            IAdminCustomerFirmBranch customerFirmBranchRepository,
            IAdminCustomerUser customerUserRepository,
            ICommon commonRepository,
            IGSTCollection gstCollection,
            IBranchTypeAdmin branchTypeAdminRepository)
            : base(loginHandler, userRepository, configurationData)
        {
            _stateRepository = stateRepository;
            _cityRepository = cityRepository;
            _countryRepository = countryRepository;
            _districtRepository = districtRepository;
            _talukaRepository = talukaRepository;
            _gstInvoiceTypeRepository = gstInvoiceTypeRepository;
            _businessRepository = businessRepository;
            _firmTypeRepository = firmTypeRepository;
            _gstFirmTypeRepository = gstFirmTypeRepository;
            _softwareRepository = softwareRepository;
            _softwarePlanRepository = softwarePlanRepository;
            _customerRepository = customerRepository;
            _customerFirmRepository = customerFirmRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _customerUserRepository = customerUserRepository;
            _commonRepository = commonRepository;
            _gstCollection = gstCollection;
            _branchTypeAdminRepository = branchTypeAdminRepository;
        }
        public IActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public JsonResult GetCountries()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _countryRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [AllowAnonymous]
        public JsonResult GetStates(int countryId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _stateRepository.SelectList(_configurationData.DefaultConnection, countryId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [AllowAnonymous]
        public JsonResult GetDistricts(int stateId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _districtRepository.SelectList(_configurationData.DefaultConnection, stateId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [AllowAnonymous]
        public JsonResult GetTalukas(int districtId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _talukaRepository.SelectList(_configurationData.DefaultConnection, districtId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [AllowAnonymous]
        public JsonResult GetCities(int stateId = 0, int talukaId = 0, int districtId = 0)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _cityRepository.SelectList(_configurationData.DefaultConnection, 0, talukaId, 0).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GSTInvoiceTypes()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _gstInvoiceTypeRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [AllowAnonymous]
        public JsonResult GetBusiness()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _businessRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetSoftware()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _softwareRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetSoftwarePlan(byte id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _softwarePlanRepository.SelectList(id, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetFirmTypeAdmin()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _firmTypeRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetCustomer()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetCustomerBySoftware(byte id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerRepository.SelectListBySoftware(id, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetCustomerBySoftwarePlan(byte id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerRepository.SelectListBySoftwarePlan(id, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetFirmList(int customerId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmRepository.SelectList(customerId, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetBranchList(int firmId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmBranchRepository.SelectList(firmId, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetUserList(int customerId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerUserRepository.SelectList(customerId, _configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetGSTFirmType()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _gstFirmTypeRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        public JsonResult GetFirmBranchTypeAdmin()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _branchTypeAdminRepository.SelectList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Common/GetTableValues/{TableName}/{ColumnName}")]
        public JsonResult GetTableValues(string TableName, string ColumnName)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _commonRepository.GetList(_configurationData.DefaultConnection, TableName, ColumnName);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Common/GetGSTCollection/{GSTNumber}")]
        public JsonResult GetGSTCollection(string GSTNumber)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _gstCollection.Get(GSTNumber, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetSoftwareByBusiness(short id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _softwareRepository.SelectList(id, _configurationData.DefaultConnection);
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
        public JsonResult SearchCity(string city)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _cityRepository.CityList(city, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Common/ErrorMessage")]
        public IActionResult ErrorMessage(string errMessage)
        {
            ViewBag.ErrMessage = errMessage;
            return View();
        }
    }
}