﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : MasterController
    {   
        public IActionResult Account()
        {
            AccountAdminViewModel model = new();
            model.AccountGroupList = _accountGroupAdminRepository.GetAccountGroupAdmin_SelectList(_configurationData.DefaultConnection);

            model.AreaNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountAdminTable._TableName, AccountAdminTable.AreaName);
            model.TransportNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountAdminTable._TableName, AccountAdminTable.TransportName);
            model.NameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountAdminTable._TableName, AccountAdminTable.Name);

            return View(model);
        }

        [HttpGet]
        public JsonResult AccountList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<AccountAdminGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _accountAdminRepository.List(_configurationData.DefaultConnection, CurrentUserId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<AccountAdminGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveAccount([FromBody] AccountAdmin model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _accountAdminRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _accountAdminRepository.Delete(id, _configurationData.DefaultConnection);
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
        public JsonResult GetAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _accountAdminRepository.Get(id, _configurationData.DefaultConnection);
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