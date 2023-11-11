using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult CustomerFirmTransportSetting(int id)
        {
            int loginId = LoginHandler.GetUserId(User);
            CustomerFirmTransportSettingViewModel model = new();

            model.Customer = _customerRepository.Get(loginId, _configurationData.DefaultConnection);

            model.CustomerFirmList = _customerFirmRepository.SelectList(model.Customer.Id, _configurationData.DefaultConnection);
            model.TransportLRChargesList = _transportLRChargesRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductList = _productRepository.GetProductList(_configurationData.DefaultConnection, loginId ,0);
            
            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmTransportSettingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<CustomerFirmTransportSettingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerFirmTransportSettingRepository.List(_configurationData.DefaultConnection, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmTransportSettingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmTransportSetting([FromBody] CustomerFirmTransportSetting model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int id = _customerFirmTransportSettingRepository.Save(model, loginId, _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirmTransportSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmTransportSettingRepository.Get(id, _configurationData.DefaultConnection);
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