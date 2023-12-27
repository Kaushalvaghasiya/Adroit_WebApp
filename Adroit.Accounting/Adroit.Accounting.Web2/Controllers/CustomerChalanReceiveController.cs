﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult ChalanReceive()
        {
            var model = new ChalanReceiveViewModel();
            var CustomerFirmBranchTransportSetting = _chalanRepository.GetChalanLabelList(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
            if (CustomerFirmBranchTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Branch" });
            }
            else
            {
                model.CustomerFirmBranchTransportSetting = CustomerFirmBranchTransportSetting;
            }

            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectListByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.GoDownNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ChalanReceiveTable._TableName, ChalanReceiveTable.GoDownNumber);
            
            ViewBag.CurrentBranchId = CurrentBranchId;
            return View(model);
        }

        [HttpPost]
        public JsonResult SaveChalanReceive([FromBody] ChalanReceiveViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.UserId = CurrentUserId;
                model.BranchId = CurrentBranchId;
                model.FirmId = CurrentFirmId;
                int id = _chalanReceiveRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetChalanReceive(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _chalanReceiveRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                result.data = data;
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
        public JsonResult ChalanReceiveList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<ChalanReceiveGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _chalanReceiveRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<ChalanReceiveGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteChalanReceive(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanReceiveRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanNumberListBySenderId/{senderId}")]
        public JsonResult GetChalanNumberListBySenderId(int senderId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetChalanNumberListBySenderId(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, senderId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanMasterListByChalanNumber/{chalanNumber}")]
        public JsonResult GetChalanMasterListByChalanNumber(int chalanNumber)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanReceiveRepository.GetChalanMasterListByChalanNumber(_configurationData.DefaultConnection, chalanNumber, CurrentUserId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanDetailListByChalanNumber/{chalanNumber}")]
        public JsonResult GetChalanDetailListByChalanNumber(int chalanNumber)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanReceiveRepository.GetChalanDetailListByChalanNumber(_configurationData.DefaultConnection, chalanNumber, CurrentUserId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanReceiveToPayAmount/{lrNumberIds}")]
        public JsonResult GetChalanReceiveToPayAmount(string lrNumberIds)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetChalanToPayAccountValueList(lrNumberIds, _configurationData.DefaultConnection, CurrentBranchId);
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