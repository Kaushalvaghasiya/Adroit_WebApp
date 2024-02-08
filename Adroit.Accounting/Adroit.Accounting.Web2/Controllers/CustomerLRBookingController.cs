using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.PrintVariables;
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
                    result.data = id;
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
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_NAME, currentFirm.Title?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_GST_TYPE, currentFirm.GSTFirmType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_AADHAR_UID, currentFirm.AdharUID?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_TYPE, currentFirm.FirmType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_OWNER, currentFirm.OwnerName?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_TAN, currentFirm.TAN?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_IEC, currentFirm.IECCode?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_LUT_BOND, currentFirm.LutBondNumber?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_BUSINESS, currentFirm.Business.ToString());


                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_GST_NO, currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_ADDRESS, currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString().Replace(" | ", ", "));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PHONE_NO, currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_EMAIL_ADDRESS, currentBranch.Email?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_NAME, currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_TYPE, currentBranch.FirmBranchType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PRINT_TITLE, currentBranch.PrintTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_CODE, currentBranch.ShortTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PAN_NO, currentBranch.PAN?.ToString());                
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_CITY, currentBranch.CityTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_TALUKA, currentBranch.TalukaTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_DISTRICT, currentBranch.DistrictTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_STATE, currentBranch.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_MOBILE_NO, currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_ALTERNATE_MOBILE_NO, currentBranch.MobileAlternate?.ToString());


                //   LRTemplate = LRTemplate.Replace("[WEBSITE]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[TO_GSTIN]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[FROM_GSTIN]", currentBranch..ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LR_DATE, DateTime.Now.ToString("dd-MM-yyyy"));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LR_NUMBER, LRBooking.LRNumber.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BOOKING_CITY, LRBooking.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_CITY, LRBooking.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNOR_NAME, LRBooking.Consignor?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNOR_MOBILE, LRBooking.ConsignorMobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNEE_MOBILE, LRBooking.ConsigneeMobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PARCLE, LRBooking.Parcel?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PACKING, LRBooking.Packing?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PRIVATE_MARK, LRBooking.PrivateMarka?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_AT, LRPrintVariables.DELIVERY_AT);
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_TYPE, LRPrintVariables.DELIVERY_TYPE);
                LRTemplate = LRTemplate.Replace(LRPrintVariables.REMARKS, LRBooking.Remarks?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.GST_P, LRBooking.gstRate?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PRODUCT_NAME, LRPrintVariables.PRODUCT_NAME);
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BOOK_NAME, LRPrintVariables.BOOK_NAME);

                string Amount_Word = Common.ConvertAmount(Convert.ToDouble(LRBooking.NetAmount.ToString()));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.IN_WORDS, Amount_Word);

                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNEE_NAME, LRBooking.Consignee?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.NOTES, CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.TERMS_AND_CONSITION, CustomerFirmBranchTransportSetting.LRSubject?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.INVOICE_NUMBER, LRBooking.InvoiceNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.INVOICE_VALUE, LRBooking.InvoiceValue?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FREIGHT, LRBooking.Freight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.EWAY_BILL_NUMBER, LRBooking.EwayBillNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.VEHICLE_NUMBER, LRBooking.BookingVehilcleNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PAY_TYPE, LRBooking.LRPayType?.ToString());


                LRTemplate = LRTemplate.Replace(LRPrintVariables.NO_OF_ARTICLES, LRBooking.Parcel?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DESCRIPTION, LRBooking.Description?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.ACTUAL_WEIGHT, LRBooking.ActualWeight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_WEIGHT, LRBooking.ChargeWeight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.RATE_ON, LRBooking.LRRateOnTitle);
                LRTemplate = LRTemplate.Replace(LRPrintVariables.RATE, LRBooking.Rate?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.AMOUNT, LRBooking.Freight?.ToString());

                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_1_VAL, LRBooking.Charges1?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_2_VAL, LRBooking.Charges2?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_3_VAL, LRBooking.Charges3?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_4_VAL, LRBooking.Charges4?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_5_VAL, LRBooking.Charges5?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LABEL_6_VAL, LRBooking.Charges6?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.NET_AMOUNT, LRBooking.NetAmount.ToString());


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