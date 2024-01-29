using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult LRBooking()
        {
            var model = new LRBookingViewModel();

            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.EwayBillNo);
            var customerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
            if (customerFirmTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Firm" });
            }
            else
            {
                model.CustomerFirmTransportSetting = customerFirmTransportSetting;
            }

            var customerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            if (customerFirmBranchTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Branch." });
            }
            else
            {
                model.CustomerFirmBranchTransportSetting = customerFirmBranchTransportSetting;
            }

            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.DescriptionList = _transportDescRepository.SelectList(_configurationData.DefaultConnection, CurrentFirmId);
            model.PackingList = _transportpackingRepository.SelectList(_configurationData.DefaultConnection, CurrentFirmId);
            model.LRRateOnList = _transportLRRateOnRepository.SelectList(_configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PaymentList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.LRDeliveryList = _transportLRDeliveryRepository.SelectList(_configurationData.DefaultConnection);
            model.LRDeliveryTypeList = _transportLRDeliveryTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            var currentUserBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentCity = _cityRepository.Get((int)currentUserBranch.CityId!, _configurationData.DefaultConnection);

            model.CityIdFrom = currentCity.Id;
            model.CityFrom = currentCity.Title;

            ViewBag.LastLrToCityCookieName = "LastLrToCityCookie" + CurrentUserId + "-" + CurrentFirmId + "-" + CurrentBranchId;
            ViewBag.LoggedInBranchCity = currentUserBranch.CityId;
            ViewBag.BookName = $"{model.CustomerFirmBranchTransportSetting.BookingSalesBookName}";

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveLRBooking([FromBody] LRBookingViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.FirmId = CurrentFirmId;
                model.BranchId = CurrentBranchId;
                model.LoginId = CurrentUserId;
                model.YearId = CurrentYearId;

                int id = _lrBookingRepository.Save(model, _configurationData.DefaultConnection);
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
                result.data = _lrBookingRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId);
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
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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
                result.data = _lrBookingRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetRate/{cityIdTo}/{billPartyId}/{rateOnId}")]
        public JsonResult GetRate(int cityIdTo, int billPartyId, int rateOnId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetRate(CurrentFirmId, CurrentBranchId, cityIdTo, billPartyId, rateOnId, CurrentUserId, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetGSTRate/{productId}")]
        public JsonResult GetGSTRate(int productId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetGSTRate(CurrentFirmId, CurrentBranchId, productId, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public IActionResult LRBookingLRBranchPrint()
        {
            var result = new ReportDataViewModel<LRBookingLRPrintModel>();
            try
            {
                result.ReportHeader = new ReportHeaderViewModel();
                result.ReportData = new LRBookingLRPrintModel();

                var id = int.Parse(HttpContext.Request.Query["id"].ToString());
                var LRBooking = _lrBookingRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId);
                var CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.Get(LRBooking.BranchId, _configurationData.DefaultConnection) ?? new CustomerFirmBranchTransportSettingViewModel() { BranchId = id };

                var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
                var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
                result.ReportHeader.FrimName = currentFirm.Title.ToString();
                result.ReportHeader.BranchName = currentBranch.Title.ToString();
                result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

                var LRTemplate = CustomerFirmBranchTransportSetting.LRTemplate;
                if (LRTemplate == "0")
                {
                    LRTemplate = Common.GetLRPrint();
                }
                LRTemplate = LRTemplate.Replace("[COMPANY_NAME]", currentFirm.Title.ToString());
                LRTemplate = LRTemplate.Replace("[TRA_GST_NO]", currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace("[ADDRESS]", currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString());
                LRTemplate = LRTemplate.Replace("[PHONE_NUMBER]", currentBranch.Mobile.ToString());
                LRTemplate = LRTemplate.Replace("[COMPAYE_EMAIL]", currentBranch.Email?.ToString());

                //   LRTemplate = LRTemplate.Replace("[website]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[To_GSTIN]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[From_GSTIN]", currentBranch..ToString());
                LRTemplate = LRTemplate.Replace("[DATE]", DateTime.Now.ToString("dd-MM-yyyy"));
                LRTemplate = LRTemplate.Replace("[L_R_NO]", LRBooking.LRNumber.ToString());
                LRTemplate = LRTemplate.Replace("[FROM_CITY]", LRBooking.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace("[TO_CITY]", LRBooking.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace("[CONSIGNOR_FROM]", LRBooking.Consignor?.ToString());
                LRTemplate = LRTemplate.Replace("[CONSIGNEE_TO]", LRBooking.Consignee?.ToString());
                LRTemplate = LRTemplate.Replace("[AT_OWNER_RISK]", CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace("[SUBJECT_TO]", CustomerFirmBranchTransportSetting.LRSubject?.ToString());
                LRTemplate = LRTemplate.Replace("[INVOICE_NO]", LRBooking.InvoiceNo?.ToString());
                LRTemplate = LRTemplate.Replace("[INVOICE_VAUE]", LRBooking.InvoiceValue?.ToString());
                LRTemplate = LRTemplate.Replace("[FREIGHT]", LRBooking.Freight?.ToString());
                LRTemplate = LRTemplate.Replace("[EWAY_BILL_NO]", LRBooking.EwayBillNo?.ToString());
                LRTemplate = LRTemplate.Replace("[VEHICLE_NO]", LRBooking.VehilcleNo?.ToString());
                LRTemplate = LRTemplate.Replace("[PAYMENT_TYPE]", LRBooking.LRPayType?.ToString());


                LRTemplate = LRTemplate.Replace("[NO_OF_ARTICLES]", LRBooking.Parcel?.ToString());
                LRTemplate = LRTemplate.Replace("[DESCRIPTION]", LRBooking.Description?.ToString());
                LRTemplate = LRTemplate.Replace("[ACT_WT]", LRBooking.ActualWeight?.ToString());
                LRTemplate = LRTemplate.Replace("[CH_WT]", LRBooking.ChargeWeight?.ToString());
                LRTemplate = LRTemplate.Replace("[RATE_ON]", LRBooking.LRRateOnTitle);
                LRTemplate = LRTemplate.Replace("[RATE]", LRBooking.Rate?.ToString());
                LRTemplate = LRTemplate.Replace("[AMOUNT]", LRBooking.Freight?.ToString());

                LRTemplate = LRTemplate.Replace("[HAMALI]", LRBooking.Charges1?.ToString());
                LRTemplate = LRTemplate.Replace("[INSURANCE]", LRBooking.Charges2?.ToString());
                LRTemplate = LRTemplate.Replace("[LOCAL_CHARGE]", LRBooking.Charges3?.ToString());
                LRTemplate = LRTemplate.Replace("[DOOR_DELI_CH]", LRBooking.Charges4?.ToString());
                LRTemplate = LRTemplate.Replace("[LR_CHARGE]", LRBooking.Charges5?.ToString());
                LRTemplate = LRTemplate.Replace("[OTHER_CHARGE]", LRBooking.Charges6?.ToString());
                LRTemplate = LRTemplate.Replace("[BILL_AMOUNT]", LRBooking.NetAmount.ToString());


                result.ReportData.LRTemplate = LRTemplate;
                result.ReportData.LRCopy = CustomerFirmBranchTransportSetting.LRCopy == 0 ? 1 :CustomerFirmBranchTransportSetting.LRCopy;
            }
            catch (Exception ex)
            {
                 
            }
      
            return View(result);
        }

    }
}