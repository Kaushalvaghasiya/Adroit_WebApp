﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult VehicleOwner()
        {
            VehicleOwnerViewModel model = new();
            model.CountryList = _countryRepository.SelectList(_configurationData.DefaultConnection);
            model.AccountList = _customerAccountRepo.GetCustomerAccountList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult VehicleOwnerList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<VehicleOwnerGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _vehicleOwnerRepo.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<VehicleOwnerGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveVehicleOwner([FromBody] VehicleOwner model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                model.AddedById = userId;
                model.ModifiedById = userId;    
                int id = _vehicleOwnerRepo.Save(model, userId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteVehicleOwner(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                _vehicleOwnerRepo.Delete(id, userId, _configurationData.DefaultConnection);
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
        public JsonResult GetVehicleOwner(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                result.data = _vehicleOwnerRepo.Get(id, userId, _configurationData.DefaultConnection);
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