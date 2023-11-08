using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;
using Adroit.Accounting.Repository;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult LRBookingRange()
        {
            int loginId = LoginHandler.GetUserId(User);
            var model = new LRBookingRangeViewModel();
            model.BranchList = _customerFirmBranchesRepository.SelectListByLoginId(loginId, _configurationData.DefaultConnection);
            model.StartNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingRangeTable._TableName, LRBookingRangeTable.StartNumber);
            model.EndNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingRangeTable._TableName, LRBookingRangeTable.EndNumber);
            return View(model);
        }

        [HttpGet]
        public JsonResult LRBookingRangeList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<LRBookingRangeGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _lrBookingRangeRepository.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingRangeGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveLRBookingRange([FromBody] LRBookingRange model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int UserId = LoginHandler.GetUserId(User);
                model.AddedById = UserId;
                model.ModifiedById = UserId;

                int id = _lrBookingRangeRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteLRBookingRange(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                _lrBookingRangeRepository.Delete(id, userId, _configurationData.DefaultConnection);
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
        public JsonResult GetLRBookingRange(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRangeRepository.Get(id, _configurationData.DefaultConnection);
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