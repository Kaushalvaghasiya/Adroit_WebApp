﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : MasterController
    {
        public IActionResult SoftwarePlan()
        {
            var model = new SoftwarePlanViewModel();
            model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, SoftwarePlanTable._TableName, SoftwarePlanTable.Title);
            model.BusinessList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, SoftwarePlanTable._TableName, SoftwarePlanTable.Business);
            model.CodeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, SoftwarePlanTable._TableName, SoftwarePlanTable.Code);

            return View(model);
        }

        [HttpGet]
        public JsonResult SoftwarePlanList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<SoftwarePlanGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _softwarePlanRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<SoftwarePlanGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveSoftwarePlan([FromBody] SoftwarePlan model)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);

                int id = _softwarePlanRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteSoftwarePlan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _softwarePlanRepository.Delete(id, _configurationData.DefaultConnection);
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
        public JsonResult GetSoftwarePlan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _softwarePlanRepository.Get(id, _configurationData.DefaultConnection);
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