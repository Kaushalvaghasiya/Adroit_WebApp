using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Text;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        [Route("~/admin/softwareplan")]
        public IActionResult SoftwarePlan()
        {
            return View();
        }

        [HttpGet]
        public JsonResult SoftwarePlanList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableList<SoftwarePlan>();
            try
            {
                int loginId = 0, firmId = 0;
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = softwarePlanRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<SoftwarePlan>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveSoftwarePlan([FromBody] SoftwarePlan savedata)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
               
                int id = softwarePlanRepo.Save(savedata, ConfigurationData.DefaultConnection);
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
        public JsonResult DeleteSoftwarePlan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                softwarePlanRepo.Delete(id, ConfigurationData.DefaultConnection);
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
                result.data = softwarePlanRepo.Get(id, ConfigurationData.DefaultConnection);
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