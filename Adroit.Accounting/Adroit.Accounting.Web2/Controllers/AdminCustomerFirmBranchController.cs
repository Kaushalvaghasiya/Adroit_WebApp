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
        public IActionResult CustomerFirmBranch()
        {
            return View();
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableList<CustomerFirmBranch>();
            try
            {
                int sortColumn = 0, loginId = 0;
                string sortDirection = "asc", search = "";
                //// note: we only sort one column at a time
                search = Convert.ToString(Request.Query["search[value]"]);
                //sortColumn = int.Parse(Request.Query["order[0][column]"]);
                //sortDirection = Convert.ToString(Request.Query["order[0][dir]"]);

                var records = CustomerFirmBranchRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmBranch>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmBranch([FromBody] CustomerFirmBranch savedata)
        {
            ApiResult result = new ApiResult();
            try
            {
                var UserId = 1;//Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                savedata.AddedById = UserId;
                savedata.ModifiedById = UserId;
                int id = CustomerFirmBranchRepo.Save(savedata, ConfigurationData.DefaultConnection);
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
        public JsonResult DeleteCustomerFirmBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var UserId = 1;// Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
              
                CustomerFirmBranchRepo.Delete(id, UserId, ConfigurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirmBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = CustomerFirmBranchRepo.Get(id, ConfigurationData.DefaultConnection);
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
