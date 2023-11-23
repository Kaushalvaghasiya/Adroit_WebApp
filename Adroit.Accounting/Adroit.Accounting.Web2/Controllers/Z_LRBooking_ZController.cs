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
        public IActionResult Z_LRBooking_Z()
        {
            var model = new Z_LRBooking_ZViewModel();
            int loginId = LoginHandler.GetUserId(User);

            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, Z_LRBooking_ZTable._TableName, Z_LRBooking_ZTable.EwayBillNo);
            model.CustomerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
            model.CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.Get(CurrentBranchId, _configurationData.DefaultConnection);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.DescriptionList = _transportDescRepository.SelectList(_configurationData.DefaultConnection);
            model.PackingList = _transportpackingRepository.SelectList(loginId, _configurationData.DefaultConnection);
            model.LRRateOnList = _transportLRRateOnRepository.SelectList(_configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountListWithGSTNo_MobileNo(loginId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PaymentList = _customerFirmBranchTransportSettingRepository.GetLRPayTypeList(CurrentBranchId, _configurationData.DefaultConnection);
            model.LRDeliveryList = _transportLRDeliveryRepository.SelectList(_configurationData.DefaultConnection);
            model.LRDeliveryTypeList = _transportLRDeliveryTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.VehicleList = _vehicleRepo.SelectList(loginId, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveZ_LRBooking_Z([FromBody] Z_LRBooking_Z model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int id = _z_lrBooking_ZRepository.Save(model, CurrentFirmId, CurrentBranchId, loginId, _configurationData.DefaultConnection);
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
        public JsonResult GetZ_LRBooking_Z(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _z_lrBooking_ZRepository.Get(id, _configurationData.DefaultConnection);
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
        public JsonResult Z_LRBooking_ZList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<Z_LRBooking_ZGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _z_lrBooking_ZRepository.List(_configurationData.DefaultConnection, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<Z_LRBooking_ZGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteZ_LRBooking_Z(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _z_lrBooking_ZRepository.Delete(id, loginId, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetZ_LRBooking_Z_Rate/{cityIdTo}/{billPartyId}/{rateOnId}")]
        public JsonResult GetZ_LRBooking_Z_Rate(int cityIdTo, int billPartyId, int rateOnId)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                var resData = _z_lrBooking_ZRepository.GetLRBookingRate(CurrentFirmId, CurrentBranchId, cityIdTo, billPartyId, rateOnId, loginId, _configurationData.DefaultConnection);
                result.data = new { Rate = resData.Item1, IsRateDisable = resData.Item2 };
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetLRNumber()
        {
            ApiResult result = new ApiResult();
            try
            {

                int? lrNumber = _z_lrBooking_ZRepository.GetLRNumber(CurrentBranchId, _configurationData.DefaultConnection);
                result.data = lrNumber ?? 0; 
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