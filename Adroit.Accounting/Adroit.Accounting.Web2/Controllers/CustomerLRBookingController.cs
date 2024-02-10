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
                var CustomerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
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
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_NAME.DescriptionAttr(), currentFirm.Title?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_GST_TYPE.DescriptionAttr(), currentFirm.GSTFirmType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_AADHAR_UID.DescriptionAttr(), currentFirm.AdharUID?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_TYPE.DescriptionAttr(), currentFirm.FirmType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_OWNER.DescriptionAttr(), currentFirm.OwnerName?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_TAN.DescriptionAttr(), currentFirm.TAN?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_IEC.DescriptionAttr(), currentFirm.IECCode?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_LUT_BOND.DescriptionAttr(), currentFirm.LutBondNumber?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FIRM_BUSINESS.DescriptionAttr(), currentFirm.Business.ToString());


                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_GST_NO.DescriptionAttr(), currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_ADDRESS.DescriptionAttr(), currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString().Replace(" | ", ", "));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PHONE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_EMAIL_ADDRESS.DescriptionAttr(), currentBranch.Email?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_NAME.DescriptionAttr(), currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_TYPE.DescriptionAttr(), currentBranch.FirmBranchType?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PRINT_TITLE.DescriptionAttr(), currentBranch.PrintTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_CODE.DescriptionAttr(), currentBranch.ShortTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_PAN_NO.DescriptionAttr(), currentBranch.PAN?.ToString());                
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_CITY.DescriptionAttr(), currentBranch.CityTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_TALUKA.DescriptionAttr(), currentBranch.TalukaTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_DISTRICT.DescriptionAttr(), currentBranch.DistrictTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_STATE.DescriptionAttr(), currentBranch.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_MOBILE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BRANCH_ALTERNATE_MOBILE_NO.DescriptionAttr(), currentBranch.MobileAlternate?.ToString());


                //   LRTemplate = LRTemplate.Replace("[WEBSITE]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[TO_GSTIN]", currentBranch..ToString());
                //   LRTemplate = LRTemplate.Replace("[FROM_GSTIN]", currentBranch..ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LR_DATE.DescriptionAttr(), DateTime.Now.ToString("dd-MM-yyyy"));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.LR_NUMBER.DescriptionAttr(), LRBooking.LRNumber.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BOOKING_CITY.DescriptionAttr(), LRBooking.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_CITY.DescriptionAttr(), LRBooking.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNOR_NAME.DescriptionAttr(), LRBooking.Consignor?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNOR_MOBILE.DescriptionAttr(), LRBooking.ConsignorMobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNEE_MOBILE.DescriptionAttr(), LRBooking.ConsigneeMobile?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PARCLE.DescriptionAttr(), LRBooking.Parcel?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PACKING.DescriptionAttr(), LRBooking.Packing?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PRIVATE_MARK.DescriptionAttr(), LRBooking.PrivateMarka?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_AT.DescriptionAttr(), LRPrintVariables.DELIVERY_AT.DescriptionAttr());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DELIVERY_TYPE.DescriptionAttr(), LRPrintVariables.DELIVERY_TYPE.DescriptionAttr());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.REMARKS.DescriptionAttr(), LRBooking.Remarks?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.GST_P.DescriptionAttr(), LRBooking.gstRate?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PRODUCT_NAME.DescriptionAttr(), LRPrintVariables.PRODUCT_NAME.DescriptionAttr());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.BOOK_NAME.DescriptionAttr(), LRPrintVariables.BOOK_NAME.DescriptionAttr());

                string Amount_Word = Common.ConvertAmount(Convert.ToDouble(LRBooking.NetAmount.ToString()));
                LRTemplate = LRTemplate.Replace(LRPrintVariables.IN_WORDS.DescriptionAttr(), Amount_Word);

                LRTemplate = LRTemplate.Replace(LRPrintVariables.CONSIGNEE_NAME.DescriptionAttr(), LRBooking.Consignee?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.NOTES.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.TERMS_AND_CONDITIONS.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubject?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.INVOICE_NUMBER.DescriptionAttr(), LRBooking.InvoiceNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.INVOICE_VALUE.DescriptionAttr(), LRBooking.InvoiceValue?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.FREIGHT.DescriptionAttr(), LRBooking.Freight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.EWAY_BILL_NUMBER.DescriptionAttr(), LRBooking.EwayBillNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.VEHICLE_NUMBER.DescriptionAttr(), LRBooking.BookingVehilcleNo?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.PAY_TYPE.DescriptionAttr(), LRBooking.LRPayType?.ToString());


                LRTemplate = LRTemplate.Replace(LRPrintVariables.NO_OF_ARTICLES.DescriptionAttr(), LRBooking.Parcel?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.DESCRIPTION.DescriptionAttr(), LRBooking.Description?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.ACTUAL_WEIGHT.DescriptionAttr(), LRBooking.ActualWeight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_WEIGHT.DescriptionAttr(), LRBooking.ChargeWeight?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.RATE_ON.DescriptionAttr(), LRBooking.LRRateOnTitle);
                LRTemplate = LRTemplate.Replace(LRPrintVariables.RATE.DescriptionAttr(), LRBooking.Rate?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.AMOUNT.DescriptionAttr(), LRBooking.Freight?.ToString());

                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_1.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable1?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_1_VAL.DescriptionAttr(), LRBooking.Charges1?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_2.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable2?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_2_VAL.DescriptionAttr(), LRBooking.Charges2?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_3.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable3?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_3_VAL.DescriptionAttr(), LRBooking.Charges3?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_4.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable4?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_4_VAL.DescriptionAttr(), LRBooking.Charges4?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_5.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable5?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_5_VAL.DescriptionAttr(), LRBooking.Charges5?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_6.DescriptionAttr(), CustomerFirmTransportSetting.LRBookChargeLable6?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.CHARGE_LABEL_6_VAL.DescriptionAttr(), LRBooking.Charges6?.ToString());
                LRTemplate = LRTemplate.Replace(LRPrintVariables.NET_AMOUNT.DescriptionAttr(), LRBooking.NetAmount.ToString());


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