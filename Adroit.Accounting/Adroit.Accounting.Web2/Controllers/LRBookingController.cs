using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult LRBooking()
        {
            var model = new LRBookingViewModel();
            int loginId = LoginHandler.GetUserId(User);

            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.EwayBillNo);
            model.CustomerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
            model.CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.Get(CurrentBranchId, _configurationData.DefaultConnection);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.DescriptionList = _transportDescRepository.SelectList(_configurationData.DefaultConnection);
            model.PackingList = _transportpackingRepository.SelectList(loginId, _configurationData.DefaultConnection);
            model.LRRateOnList = _transportLRRateOnRepository.SelectList(_configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountListWithGSTNo_MobileNo(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PaymentList = _transportLRPayTypeRepository.GetLRPayTypeList(CurrentBranchId, _configurationData.DefaultConnection);
            model.LRDeliveryList = _transportLRDeliveryRepository.SelectList(_configurationData.DefaultConnection);
            model.LRDeliveryTypeList = _transportLRDeliveryTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.VehicleList = _vehicleRepo.SelectList(loginId, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveLRBooking([FromBody] LRBooking model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                model.BranchId = CurrentBranchId;
                int id = _lrBookingRepository.Save(model, _configurationData.DefaultConnection, loginId);
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
        public JsonResult GetLRBooking(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _lrBookingRepository.Get(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
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
        public JsonResult LRBookingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.List(_configurationData.DefaultConnection, CurrentBranchId, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteLRBooking(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _lrBookingRepository.Delete(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetLRBookingRate/{cityIdTo}/{billPartyId}/{rateOnId}")]
        public JsonResult GetLRBookingRate(int cityIdTo, int billPartyId, int rateOnId)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _lrBookingRepository.GetLRBookingRate(CurrentFirmId, CurrentBranchId, cityIdTo, billPartyId, rateOnId, loginId, _configurationData.DefaultConnection);
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