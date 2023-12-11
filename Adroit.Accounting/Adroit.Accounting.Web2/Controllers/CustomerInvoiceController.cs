using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult CustomerInvoice()
        {
            return View();
        }

        [HttpGet]
        public JsonResult InvoiceList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerInvoiceGridViewModel>();
            try
            {
                //int loginId = LoginHandler.GetUserId(User);
                ////// note: we only sort one column at a time
                //var search = Request.Query["search[value]"];
                //var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                //var sortDirection = Request.Query["order[0][dir]"];

                //var records = _customerInvoice.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                //result.data = records;
                //result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                //result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                //result.data = new List<ProductGridViewModel>();
                //result.recordsTotal = 0;
                //result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveInvoice([FromBody] ProductViewModel model)
        {
            ApiResult result = new ApiResult();
            //try
            //{
            //    model.loginId = LoginHandler.GetUserId(User);
            //    model.softwareId = _softwareRepository.GetSoftwareIdByLoginId(model.loginId, _configurationData.DefaultConnection);

            //    int id = _productRepository.Save(model, _configurationData.DefaultConnection, CurrentFirmId);
            //    if (id > 0)
            //    {
            //        result.data = true;
            //        result.result = Constant.API_RESULT_SUCCESS;
            //    }
            //}
            //catch (Exception ex)
            //{
            //    result.data = ErrorHandler.GetError(ex);
            //    result.result = Constant.API_RESULT_ERROR;
            //}
            return Json(result);
        }

        [HttpGet]
        public JsonResult DeleteInvoice(int id)
        {
            ApiResult result = new ApiResult();
            //try
            //{
            //    int loginId = LoginHandler.GetUserId(User);
            //    CustomerInvoiceGridViewModel.Delete(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
            //    result.result = Constant.API_RESULT_SUCCESS;
            //}
            //catch (Exception ex)
            //{
            //    result.data = ErrorHandler.GetError(ex);
            //    result.result = Constant.API_RESULT_ERROR;
            //}
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetInvoice(int id)
        {
            ApiResult result = new ApiResult();
            //try
            //{
            //    int loginId = LoginHandler.GetUserId(User);
            //    result.data = CustomerInvoiceGridViewModel.Get(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
            //    result.result = Constant.API_RESULT_SUCCESS;
            //}
            //catch (Exception ex)
            //{
            //    result.data = ErrorHandler.GetError(ex);
            //    result.result = Constant.API_RESULT_ERROR;
            //}
            return Json(result);
        }
    }
}