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
        public IActionResult CustomerFirmBranchTransportChalanDetailSetting(int id)
        {
            CustomerFirmBranchTransportSettingViewModel model = new();
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
            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectListByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            model.TransportLRRateOnList = _transportLRRateOnRepository.SelectList(_configurationData.DefaultConnection);
            model.TransportLRPayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.ChalanDetailTemplate = Common.GetChalanDetailPrint();
            return View(model);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmBranchTransportChalanDetailSetting([FromBody] CustomerFirmBranchTransportSettingViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.LoginId = CurrentUserId;
                int id = _customerFirmBranchTransportSettingRepository.SaveTemplate(model, _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirmBranchTransportChalanDetailSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var model = _customerFirmBranchTransportSettingRepository.Get(id, _configurationData.DefaultConnection) ?? new CustomerFirmBranchTransportSettingViewModel() { BranchId = id };
                model.CustomerAccountList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, model.BranchId, _configurationData.DefaultConnection);
                model.CustomerBookList = _customerBookRepository.SelectList(model.BranchId, _configurationData.DefaultConnection);
                if (model.ChalanDetailTemplate == "0")
                {
                    model.ChalanDetailTemplate = Common.GetChalanDetailPrint();
                }

                result.data = model;
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