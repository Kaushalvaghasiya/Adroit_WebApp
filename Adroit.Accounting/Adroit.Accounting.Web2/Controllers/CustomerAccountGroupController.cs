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
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerAccountGroup()
        {
            var model = new CustomerAccountGroupViewModel();
            model.AccountGroupTypeList = _accountGroupType.GetAccountGroupTypeList(_configurationData.DefaultConnection);
            model.CustomerAccountGroupList = _customerAccountGroupHeader.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.CodeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountGroupTable._TableName, CustomerAccountGroupTable.Code);
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountGroupTable._TableName, CustomerAccountGroupTable.Title);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountGroupTable._TableName, CustomerAccountGroupTable.OrderNumber);
            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerAccountGroupList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<CustomerAccountGroupGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerAccountGroupRepo.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerAccountGroupGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerAccountGroup([FromBody] CustomerAccountGroup model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.AddedById = CurrentUserId;
                int id = _customerAccountGroupRepo.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteCustomerAccountGroup(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _customerAccountGroupRepo.Delete(id,CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerAccountGroup(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountGroupRepo.Get(id,CurrentUserId, _configurationData.DefaultConnection);
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