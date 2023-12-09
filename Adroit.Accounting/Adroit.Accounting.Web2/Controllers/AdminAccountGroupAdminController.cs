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
    public partial class AdminController : MasterController
    {
        public IActionResult AccountGroupAdmin()
        {
            var model = new AccountGroupAdminViewModel();
            model.AccountGroupTypeList = _accountGroupAdminRepository.SelectAccountGroupTypeList(_configurationData.DefaultConnection);
            model.AccountGroupHeaderAdminList = _accountGroupHeaderAdminRepository.SelectList(_configurationData.DefaultConnection);
            model.CodeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountGroupAdminTable._TableName, AccountGroupAdminTable.Code);
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountGroupAdminTable._TableName, AccountGroupAdminTable.Title);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, AccountGroupAdminTable._TableName, AccountGroupAdminTable.OrderNumber);
            return View(model);
        }

        [HttpGet]
        public JsonResult AccountGroupAdminList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<AccountGroupAdminGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _accountGroupAdminRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<AccountGroupAdminGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveAccountGroupAdmin([FromBody] AccountGroupAdmin model)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);

                int id = _accountGroupAdminRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteAccountGroupAdmin(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _accountGroupAdminRepository.Delete(id, _configurationData.DefaultConnection);
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
        public JsonResult GetAccountGroupAdmin(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _accountGroupAdminRepository.Get(id, _configurationData.DefaultConnection);
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