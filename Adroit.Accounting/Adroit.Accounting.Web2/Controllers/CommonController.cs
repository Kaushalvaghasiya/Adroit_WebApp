using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Authorization;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Web.Controllers
{
    public class CommonController : Controller
    {
        private IState _stateRepo;
        private ICity _cityRepo;
        private ICountry _countryRepo;
        private ITaluka _talukaRepo;
        private IDistrict _districtRepo;
        private IGSTInvoiceType _gstInvoiceTypeRepo;
        private readonly ConfigurationData _configurationData;
        private IBusiness _businessRepo;
        private IFirmTypeAdmin _firmTypeAdminRepo;
        private IGSTFirmType _gstFirmTypeRepo;
        private ISoftwareType _softwareTypeRepo;
        private ICustomer _customerRepo;
        private IFirmBranchTypeAdmin _firmBranchTypeAdminRepo;
        private IFirm _firmRepo;
        private ICommon _commonRepository;


        public CommonController(IOptions<ConfigurationData> configurationData, IState stateRepo, ICity cityRepo,
                ICountry countryRepo, IDistrict districtRepo, ITaluka talukaRepository,
                IGSTInvoiceType gstInvoiceTypeRepo,
                IBusiness business,
                ISoftwareType softwareTypeRepo,
                IFirmTypeAdmin firmTypeAdminRepo,
                IGSTFirmType gstFirmTypeRepo,
                ICustomer customerRepo,
                IFirmBranchTypeAdmin firmBranchTypeAdminRepo,
                IFirm firmRepo,
                ICommon commonRepository
            )
        {
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _configurationData = configurationData.Value;
            _countryRepo = countryRepo;
            _districtRepo = districtRepo;
            _talukaRepo = talukaRepository;
            _gstInvoiceTypeRepo = gstInvoiceTypeRepo;
            _businessRepo = business;
            _firmTypeAdminRepo = firmTypeAdminRepo;
            _gstFirmTypeRepo = gstFirmTypeRepo;
            _softwareTypeRepo = softwareTypeRepo;
            _customerRepo = customerRepo;
            _firmBranchTypeAdminRepo = firmBranchTypeAdminRepo;
            _firmRepo = firmRepo;
            _commonRepository = commonRepository;
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
                result.data = _countryRepo.GetCountryList(_configurationData.DefaultConnection).ToList();
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
                result.data = _stateRepo.GetStateList(_configurationData.DefaultConnection, countryId).ToList();
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
                result.data = _districtRepo.GetDistrictList(_configurationData.DefaultConnection, stateId).ToList();
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
                result.data = _talukaRepo.GetTalukaList(_configurationData.DefaultConnection, districtId).ToList();
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
                result.data = _cityRepo.GetCityList(_configurationData.DefaultConnection, 0, talukaId, 0).ToList();
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
                result.data = _gstInvoiceTypeRepo.GetGSTInvoiceTypeList(_configurationData.DefaultConnection).ToList();
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
                result.data = _businessRepo.GetBusinessList(_configurationData.DefaultConnection).ToList();
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
                result.data = _softwareTypeRepo.GetSoftwareTypeList(_configurationData.DefaultConnection).ToList();
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
                result.data = _firmTypeAdminRepo.GetFirmTypeAdminList(_configurationData.DefaultConnection).ToList();
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
                result.data = _customerRepo.GetCustomerList(_configurationData.DefaultConnection).ToList();
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
                result.data = _gstFirmTypeRepo.GetGSTFirmTypeList(_configurationData.DefaultConnection).ToList();
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
                result.data = _firmBranchTypeAdminRepo.GetFirmBranchTypeAdminList(_configurationData.DefaultConnection).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetFirm()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _firmRepo.GetFirmList(_configurationData.DefaultConnection).ToList();
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
                result.data = (from item in _commonRepository.GetList(_configurationData.DefaultConnection, TableName, ColumnName).ToList()
                               select new DropdownViewModel() { Text = item, Value = item }).ToList();
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