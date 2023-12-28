using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Book()
        {
            var model = new CustomerBookViewModel();

            var customerId = _customerRepository.GetCustomerIdByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            var Customer = _customerRepository.Get(customerId, _configurationData.DefaultConnection);
            if (Customer == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please ask your admin to add your customer data" });
            }
            else
            {
                model.Customer = Customer;
            }
            model.CustomerAccountList = _customerAccountRepo.GetCustomerAccountListWithAccountGroup(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BookTypeList = _bookTypeRepository.GetBookTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BranchList = _customerFirmBranchRepository.SelectListByFirmId(CurrentFirmId, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveBook([FromBody] CustomerBook model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerBookRepository.Save(model, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId);
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
                result.data = _customerBookRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
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
            var result = new DataTableListViewModel<CustomerBookGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerBookRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerBookGridViewModel>();
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
                result.data = _customerBookRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
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