using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        [Route("~/customer/firm/branch")]
        public IActionResult CustomerFirmBranch(int id)
        {
            CustomerFirmBranchViewModel model = new();
            model.Firm = new();

            if (id != 0)
            {
                model.Firm = _adminCustomerFirmRepository.Get(id, _configurationData.DefaultConnection);
                model.FirmId = model.Firm.Id;
            }
            var customerId = _customerRepository.GetCustomerIdByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            var Customer = _customerRepository.Get(customerId, _configurationData.DefaultConnection);
            if (Customer == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please ask your admin to add your customer data" });
            }
            else
            {
                model.Firm.Customer = Customer;
            }
            model.BranchTypeList = _branchTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchTable._TableName, CustomerFirmBranchTable.OrderNumber);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerFirmBranchGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerFirmBranchRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmBranchGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmBranch([FromBody] CustomerFirmBranch model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerFirmBranchRepository.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteCustomerFirmBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _customerFirmBranchRepository.Delete(id, CurrentUserId, CurrentFirmId, _configurationData.DefaultConnection);
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
                result.data = _customerFirmBranchRepository.Get(id, CurrentFirmId, _configurationData.DefaultConnection);
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