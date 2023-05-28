using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Save([FromBody] BookAdmin model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = BookAdminRepo.Save(model, ConfigurationData.DefaultConnection);
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
        public JsonResult Get(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = BookAdminRepo.Get(id, ConfigurationData.DefaultConnection, 0, 0);
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
        public JsonResult List(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableList<BookAdmin>();
            try
            {
                int sortColumn = 0, loginId = 0, firmId = 0;
                string sortDirection = "asc", search = "";

                //// note: we only sort one column at a time
                //search = Convert.ToString(Request.Query["search[value]"]);
                //sortColumn = int.Parse(Request.Query["order[0][column]"]);
                //sortDirection = Convert.ToString(Request.Query["order[0][dir]"]);

                var records = BookAdminRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<BookAdmin>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult Delete(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = BookAdminRepo.Delete(id, ConfigurationData.DefaultConnection, 0, 0);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetAccountAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = AccountAdminRepo.GetAccountAdminList(ConfigurationData.DefaultConnection, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetBillTypeAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = BillTypeAdminRepo.GetBillTypeAdminList(ConfigurationData.DefaultConnection, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetBillEntryTypeAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = BillEntryTypeAdminRepo.GetBillEntryTypeAdminList(ConfigurationData.DefaultConnection, loginId, firmId).ToList(); ;
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