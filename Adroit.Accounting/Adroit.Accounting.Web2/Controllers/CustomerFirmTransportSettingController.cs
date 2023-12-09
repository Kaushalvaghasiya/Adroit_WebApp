using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerFirmTransportSetting(int id)
        {
            CustomerFirmTransportSettingViewModel model = new();
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

            model.CustomerFirmList = _adminCustomerFirmRepository.SelectList(model.Customer.Id, _configurationData.DefaultConnection);
            model.TransportLRChargesList = _transportLRChargesRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductList = _productRepository.GetProductList(CurrentFirmId, _configurationData.DefaultConnection, CurrentUserId);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmTransportSettingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<CustomerFirmTransportSettingGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerFirmTransportSettingRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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
                int id = _customerFirmTransportSettingRepository.Save(model, _configurationData.DefaultConnection, CurrentUserId);
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