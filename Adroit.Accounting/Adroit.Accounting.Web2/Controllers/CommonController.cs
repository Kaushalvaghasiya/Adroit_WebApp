﻿using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Authorization;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;

namespace Adroit.Accounting.Web.Controllers
{
    public class CommonController : Controller
    {
        private IState _stateRepository;
        private ICity _cityRepository;
        private ICountry _countryRepository;
        private ITaluka _talukaRepository;
        private IDistrict _districtRepository;
        private IGSTInvoiceType _gstInvoiceTypeRepository;
        private readonly ConfigurationData _configurationData;
        private IBusiness _businessRepository;
        private IFirmTypeAdmin _firmTypeAdminRepository;
        private IGSTFirmType _gstFirmTypeRepository;
        private ISoftware _softwareRepository;
        private ICustomer _customerRepository;
        private IFirmBranchTypeAdmin _firmBranchTypeAdminRepository;
        private IFirm _firmRepository;
        private ICommon _commonRepository;


        public CommonController(
            IOptions<ConfigurationData> configurationData, 
            IState stateRepository, 
            ICity cityRepository,
            ICountry countryRepository, 
            IDistrict districtRepository, 
            ITaluka talukaRepository,
            IGSTInvoiceType gstInvoiceTypeRepository,
            IBusiness businessRepository,
            ISoftware softwareRepository,
            IFirmTypeAdmin firmTypeAdminRepository,
            IGSTFirmType gstFirmTypeRepository,
            ICustomer customerRepository,
            IFirmBranchTypeAdmin firmBranchTypeAdminRepository,
            IFirm firmRepository,
            ICommon commonRepository
            )
        {
            _stateRepository = stateRepository;
            _cityRepository = cityRepository;
            _configurationData = configurationData.Value;
            _countryRepository = countryRepository;
            _districtRepository = districtRepository;
            _talukaRepository = talukaRepository;
            _gstInvoiceTypeRepository = gstInvoiceTypeRepository;
            _businessRepository = businessRepository;
            _firmTypeAdminRepository = firmTypeAdminRepository;
            _gstFirmTypeRepository = gstFirmTypeRepository;
            _softwareRepository = softwareRepository;
            _customerRepository = customerRepository;
            _firmBranchTypeAdminRepository = firmBranchTypeAdminRepository;
            _firmRepository = firmRepository;
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
                result.data = _countryRepository.GetCountryList(_configurationData.DefaultConnection).ToList();
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
                result.data = _stateRepository.GetStateList(_configurationData.DefaultConnection, countryId).ToList();
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
                result.data = _districtRepository.GetDistrictList(_configurationData.DefaultConnection, stateId).ToList();
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
                result.data = _talukaRepository.GetTalukaList(_configurationData.DefaultConnection, districtId).ToList();
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
                result.data = _cityRepository.GetCityList(_configurationData.DefaultConnection, 0, talukaId, 0).ToList();
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
                result.data = _gstInvoiceTypeRepository.GetGSTInvoiceTypeList(_configurationData.DefaultConnection).ToList();
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
                result.data = _businessRepository.GetBusinessList(_configurationData.DefaultConnection).ToList();
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


        public JsonResult GetFirmTypeAdmin()
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _firmTypeAdminRepository.GetFirmTypeAdminList(_configurationData.DefaultConnection).ToList();
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
                result.data = _customerRepository.GetCustomerList(_configurationData.DefaultConnection).ToList();
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
                result.data = _gstFirmTypeRepository.GetGSTFirmTypeList(_configurationData.DefaultConnection).ToList();
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
                result.data = _firmBranchTypeAdminRepository.GetFirmBranchTypeAdminList(_configurationData.DefaultConnection).ToList();
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
                result.data = _firmRepository.GetFirmList(_configurationData.DefaultConnection).ToList();
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
    }
}