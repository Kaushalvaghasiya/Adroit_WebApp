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
    public partial class CustomerController : Controller
    {
        public IActionResult Book()
        {
            var model = new CustomerBookViewModel();

            int loginId = LoginHandler.GetUserId(User);
            int firmId = CurrentFirmId;
            model.Customer = _customerRepository.Get(loginId, _configurationData.DefaultConnection);
            model.CustomerAccountList = _customerAccountRepo.GetCustomerAccountListWithAccountGroup(_configurationData.DefaultConnection,loginId, firmId);
            model.BookTypeList = _bookTypeRepository.GetBookTypeAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, loginId, firmId);
            model.BranchList = _customerFirmBranchRepository.SelectList(model.Customer.Id, true, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveBook([FromBody] CustomerBook model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int branchId = LoginHandler.GetBranchId(User, _userRepository, _configurationData.DefaultConnection);

                int id = _customerBookRepository.Save(model, _configurationData.DefaultConnection, loginId, branchId, CurrentFirmId);
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
                int loginId = LoginHandler.GetUserId(User);
                result.data = _customerBookRepository.Get(id, _configurationData.DefaultConnection, loginId);
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
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerBookRepository.List(_configurationData.DefaultConnection, search, start, length, sortColumn, sortDirection).ToList();
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
                int loginId = LoginHandler.GetUserId(User);
                result.data = _customerBookRepository.Delete(id, _configurationData.DefaultConnection, loginId);
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