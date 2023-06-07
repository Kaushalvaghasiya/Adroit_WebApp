﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Controllers;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Data;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        [Route("~/admin/customer/firm")]
        public IActionResult CustomerFirm(int? id = 0, int? editid = 0)
        {

            ViewBag.Id = id;
            ViewBag.EditId = editid;
            return View();
        }

        [HttpGet]
        public JsonResult CustomerFirmList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableList<CustomerFirm>();
            try
            {
                int loginId = 0, firmId = 0;
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = CustomerFirmRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection, customerId).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirm>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirm([FromBody] CustomerFirm savedata)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                //savedata.AddedById = UserId;
                //savedata.ModifiedById = UserId;
                int id = CustomerFirmRepo.Save(savedata, ConfigurationData.DefaultConnection);
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

        [HttpDelete]
        public JsonResult DeleteCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var UserId = 1;// Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                //need change login customer id
                CustomerFirmRepo.Delete(id, UserId, ConfigurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = CustomerFirmRepo.Get(id, ConfigurationData.DefaultConnection);
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