﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        public IActionResult Vehicle()
        {
            var model = new VehicleViewModel();
            //model.VehicleModelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, VehicleTable._TableName, VehicleTable.Title);
            //model.VehicleModelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, VehicleTable._TableName, VehicleTable.Title);
            //model.PhoneCodeLsit = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, VehicleTable._TableName, VehicleTable.PhoneCode);
            return View(model);
        }

        [HttpGet]
        public JsonResult VehicleList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<VehicleGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _vehicleRepository.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<VehicleGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveVehicle([FromBody] Vehilcle model)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);

                int id = _vehicleRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetVehicle(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _vehicleRepository.Get(id, _configurationData.DefaultConnection);
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