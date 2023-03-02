using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class CommonController : Controller
    {
        private IStateRepository _stateRepo;
        private ICityRepository _cityRepo;
        private ICountryRepository _countryRepo;
        private ITalukaRepository _talukaRepo;
        private IDistrictRepository _districtRepo;
        private IGSTInvoiceTypeRepository _gstInvoiceTypeRepo;
        private readonly ConfigurationData _configurationData;

        public CommonController(IOptions<ConfigurationData> configurationData, IStateRepository stateRepo, ICityRepository cityRepo, 
                ICountryRepository countryRepo, IDistrictRepository districtRepo, ITalukaRepository talukaRepository, 
                IGSTInvoiceTypeRepository gstInvoiceTypeRepo)
        {
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _configurationData = configurationData.Value;
            _countryRepo = countryRepo;
            _districtRepo = districtRepo;
            _talukaRepo = talukaRepository;
            _gstInvoiceTypeRepo = gstInvoiceTypeRepo;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetCountries()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _countryRepo.GetCountryList(_configurationData.DatabaseConnectionString).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetStates(int countryId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _stateRepo.GetStateList(_configurationData.DatabaseConnectionString, countryId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetDistricts(int stateId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _districtRepo.GetDistrictList(_configurationData.DatabaseConnectionString, stateId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetTalukas(int districtId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _talukaRepo.GetTalukaList(_configurationData.DatabaseConnectionString, districtId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetCities(int stateId=0, int talukaId = 0, int districtId = 0)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _cityRepo.GetCityList(_configurationData.DatabaseConnectionString, 0, talukaId, 0).ToList();
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
                result.data = _gstInvoiceTypeRepo.GetGSTInvoiceTypeList(_configurationData.DatabaseConnectionString).ToList();
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
