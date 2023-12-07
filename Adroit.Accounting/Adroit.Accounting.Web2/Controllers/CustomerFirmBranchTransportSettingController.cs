using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult CustomerFirmBranchTransportSetting(int id)
        {
            int loginId = LoginHandler.GetUserId(User);
            CustomerFirmBranchTransportSettingViewModel model = new();
            var customerId = _customerRepository.GetCustomerIdByLoginId(loginId, _configurationData.DefaultConnection);
            var Customer = _customerRepository.Get(customerId, _configurationData.DefaultConnection);
            if (Customer == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please ask your admin to add your customer data" });
            }
            else
            {
                model.Customer = Customer;
            }
            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectList(model.Customer.Id, true,_configurationData.DefaultConnection);
            model.CustomerAccountList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.CustomerBookList = _customerBookRepository.SelectList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.TransportLRRateOnList = _transportLRRateOnRepository.SelectList(_configurationData.DefaultConnection);
            model.TransportLRPayTypeList= _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchTransportSettingList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerFirmBranchTransportSettingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerFirmBranchTransportSettingRepository.List(_configurationData.DefaultConnection, loginId, CurrentBranchId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmBranchTransportSettingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmBranchTransportSetting([FromBody] CustomerFirmBranchTransportSettingViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.LoginId = LoginHandler.GetUserId(User);
                int id = _customerFirmBranchTransportSettingRepository.Save(model,  _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirmBranchTransportSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmBranchTransportSettingRepository.Get(id,  _configurationData.DefaultConnection);
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