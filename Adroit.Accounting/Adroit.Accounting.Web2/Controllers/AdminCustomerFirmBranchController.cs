using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        [Route("~/admin/customer/firm/branch")]
        public IActionResult CustomerFirmBranch(int id)
        {
            CustomerFirmBranchViewModel model = new();
            model.Firm = _customerFirmRepository.Get(id, _configurationData.DefaultConnection);
            model.Firm.Customer = _customerRepository.Get(model.Firm.CustomerId, _configurationData.DefaultConnection);

            model.CountryList = _countryRepository.SelectList(_configurationData.DefaultConnection);
            model.SoftwarePlanList = _softwarePlanRepository.SelectList(model.Firm.SoftwareId, _configurationData.DefaultConnection);
            model.BranchTypeList = _branchType.SelectList(_configurationData.DefaultConnection);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchTable._TableName, CustomerFirmBranchTable.OrderNumber);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerFirmBranchGridViewModel>();
            try
            {
                int loginId = 0;
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerFirmBranchRepository.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
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
                var UserId = 1;//Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                model.AddedById = UserId;
                model.ModifiedById = UserId;
                int id = _customerFirmBranchRepository.Save(model, _configurationData.DefaultConnection);
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
                var UserId = 1;// Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);

                _customerFirmBranchRepository.Delete(id, UserId, _configurationData.DefaultConnection);
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
                result.data = _customerFirmBranchRepository.Get(id, _configurationData.DefaultConnection);
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