using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        public IActionResult Book()
        {
            var model = new BookAdminViewModel();

            int loginId = LoginHandler.GetUserId(User);
            int firmId = CurrentFirmId;
            model.BookAccountList = _accountAdminRepository.GetAccountAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BookTypeList = _bookTypeRepository.GetBookTypeAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveBook([FromBody] BookAdmin model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _bookAdminRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetBook(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _bookAdminRepository.Get(id, _configurationData.DefaultConnection, 0, 0);
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
        public JsonResult BookList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<BookAdminGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _bookAdminRepository.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<BookAdminGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteBook(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _bookAdminRepository.Delete(id, _configurationData.DefaultConnection, 0, 0);
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