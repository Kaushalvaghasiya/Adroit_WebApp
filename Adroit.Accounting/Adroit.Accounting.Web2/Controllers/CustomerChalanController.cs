using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.PrintVariables;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Chalan()
        {
            var model = new PurchaseBillMasterViewModel();
            var customerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            if (customerFirmBranchTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Branch" });
            }
            else
            {
                model.CustomerFirmBranchTransportSetting = customerFirmBranchTransportSetting;
            }

            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillMasterTable._TableName, PurchaseBillMasterTable.EwayBillNumber);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.DriverList = _driverRepository.SelectList(_configurationData.DefaultConnection, CurrentUserId);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId,_configurationData.DefaultConnection, CurrentUserId);
            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectListWithBranchToBranchMapping(CurrentUserId, _configurationData.DefaultConnection);
           
            var currentUserBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);

            ViewBag.CurrentBranchId = CurrentBranchId;
            ViewBag.LoggedInBranchCity = currentUserBranch.CityId;
            ViewBag.BookName = $"{model.CustomerFirmBranchTransportSetting.PurchaseBookName}";

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveChalan([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.FirmId = CurrentFirmId;
                model.BranchId = CurrentBranchId;
                model.LoginId = CurrentUserId;
                model.YearId = CurrentYearId;
                
                int id = _chalanRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetChalan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId);
                result.data = data;
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
        public JsonResult ChalanList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<PurchaseBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _chalanRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<PurchaseBillMasterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteChalan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetLRBookingListByCity/{fromCityIds}/{toCityIds}")]
        public JsonResult GetLRBookingListByCity(string fromCityIds, string toCityIds, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByCity(_configurationData.DefaultConnection, fromCityIds, toCityIds, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/Customer/GetChalanToPayAmount/{lrNumberIds}")]
        public JsonResult GetChalanToPayAmount(string lrNumberIds)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetChalanToPayAccountValueList(lrNumberIds, _configurationData.DefaultConnection, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByPurchaseBillMasterId/{purchaseBillMasterId}")]
        public JsonResult GetListByPurchaseBillMasterId(int purchaseBillMasterId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, purchaseBillMasterId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByLRNumberId/{lrNumberId}")]
        public JsonResult GetListByLRNumberId(int lrNumberId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetListByLRNumberId(_configurationData.DefaultConnection, lrNumberId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetTDSPercentByCustomerAccountBranchMappingId/{customerAccountBranchMappingId}")]
        public JsonResult GetTDSPercentByCustomerAccountBranchMappingId(int customerAccountBranchMappingId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.GetCustomerAccountByBranchMappingId(_configurationData.DefaultConnection, customerAccountBranchMappingId, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanCustomerAccountBranchMappingList_Select/{vehicleId}")]
        public JsonResult GetChalanCustomerAccountBranchMappingList_Select(int vehicleId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetCustomerAccountBranchMappingList_Select(CurrentUserId, CurrentFirmId, CurrentBranchId, vehicleId, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public IActionResult LRBookingChalanDetailPrint()
        {
            var result = new ReportDataViewModel<LRBookingLRPrintModel>();
            try
            {
                result.ReportHeader = new ReportHeaderViewModel();
                result.ReportData = new LRBookingLRPrintModel();

                var id = int.Parse(HttpContext.Request.Query["id"].ToString());
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId);
                var vehicle = _vehicleRepo.Get(data.VehicleId, CurrentUserId, _configurationData.DefaultConnection);
                var vehicleOwner = _vehicleOwnerRepo.Get(vehicle.OwnerId, CurrentUserId, _configurationData.DefaultConnection);
                var vehicleModel = _vehicleModelRepository.Get(vehicle.ModelId ,_configurationData.DefaultConnection);
                var CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.Get(data.BranchId, _configurationData.DefaultConnection) ?? new CustomerFirmBranchTransportSettingViewModel() { BranchId = id };

                var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
                var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
                result.ReportHeader.FrimName = currentFirm.Title.ToString();
                result.ReportHeader.BranchName = currentBranch.Title.ToString();
                result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();
                 
                var LRTemplate = CustomerFirmBranchTransportSetting.ChalanDetailTemplate;
                if (LRTemplate == "0")
                {
                    LRTemplate = Common.GetChalanDetailPrint();
                }
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_NAME.DescriptionAttr(), currentFirm.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_GST_TYPE.DescriptionAttr(), currentFirm.GSTFirmType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_AADHAR_UID.DescriptionAttr(), currentFirm.AdharUID?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_TYPE.DescriptionAttr(), currentFirm.FirmType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_OWNER.DescriptionAttr(), currentFirm.OwnerName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_TAN.DescriptionAttr(), currentFirm.TAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_IEC.DescriptionAttr(), currentFirm.IECCode?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_LUT_BOND.DescriptionAttr(), currentFirm.LutBondNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_BUSINESS.DescriptionAttr(), currentFirm.Business?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_GST_NO.DescriptionAttr(), currentBranch.GSTNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_ADDRESS.DescriptionAttr(), currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString().Replace(" | ", ", "));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PHONE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_EMAIL_ADDRESS.DescriptionAttr(), currentBranch.Email?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_NAME.DescriptionAttr(), currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_TYPE.DescriptionAttr(), currentBranch.FirmBranchType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PRINT_TITLE.DescriptionAttr(), currentBranch.PrintTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CODE.DescriptionAttr(), currentBranch.ShortTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PAN_NO.DescriptionAttr(), currentBranch.PAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CITY.DescriptionAttr(), currentBranch.CityTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_TALUKA.DescriptionAttr(), currentBranch.TalukaTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_DISTRICT.DescriptionAttr(), currentBranch.DistrictTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_STATE.DescriptionAttr(), currentBranch.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_MOBILE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_ALTERNATE_MOBILE_NO.DescriptionAttr(), currentBranch.MobileAlternate?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_DATE.DescriptionAttr(), DateTime.Now.ToString("dd-MM-yyyy"));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_BRANCH.DescriptionAttr(), currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DELIVERY_BRANCH.DescriptionAttr(), data.DeliveryBranch?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BILL_PURCHASE_PARTY.DescriptionAttr(), data.BillPartyName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BILL_PARTY.DescriptionAttr(), data.BillPartyName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.EWAY_BILL_NUMBER_PART_B.DescriptionAttr(), data.EwayBillNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_CHALAN.DescriptionAttr(), data.BillNumberFirm?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CHALAN.DescriptionAttr(), data.BillNumberBranch.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_ACCOUNT_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.ToPayAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_AMOUNT.DescriptionAttr(), data.ToPayAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_ACCOUNT_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.ToPayAmountAccountBranchMappingChargerTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingAmountAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT.DescriptionAttr(), data.CrossingAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingAmountAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingCommissionAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION.DescriptionAttr(), data.CrossingCommission?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingCommissionAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingHamaliAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI.DescriptionAttr(), data.CrossingHamali?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingHamaliAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingDeliveryChargeAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE.DescriptionAttr(), data.CrossingDeliveryCharge?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingDeliveryAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BROKER.DescriptionAttr(), data.BrokerName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BROKRAGE.DescriptionAttr(), data.BrokerAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.REMARKS.DescriptionAttr(), data.Notes?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LORRY_HIRE_FREIGHT.DescriptionAttr(), data.TaxableAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LESS_TDS_P.DescriptionAttr(), data.TDSPercent?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LESS_TDS_AMOUNT.DescriptionAttr(), data.TDSAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CASH_TO_LORRY_TRIP.DescriptionAttr(), data.AdvanceCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BANK_TRANSFER_TO_LORRY_TRIP.DescriptionAttr(), data.AdvanceNeft?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.RECEIVED_CASH_BY_DRIVER.DescriptionAttr(), data.ReceiveCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.OTHER_EXP_OF_TRIP.DescriptionAttr(), data.OtherPlus?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.OTHER_LESS.DescriptionAttr(), data.OtherLess?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_NET_AMOUNT.DescriptionAttr(), data.NetAmount?.ToString());

                string NET_AMOUNT = Common.ConvertAmount(Convert.ToDouble(data.NetAmount?.ToString()));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_AMOUNT_IN_WORDS.DescriptionAttr(), NET_AMOUNT);
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOK_NAME.DescriptionAttr(), data.CustomerBook?.BookName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CITY.DescriptionAttr(), data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_CITY.DescriptionAttr(), data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DELIVERY_CITY.DescriptionAttr(), data.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_NAME.DescriptionAttr(), data.DriverName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_ADDRESS.DescriptionAttr(), data.DriverAddress?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_LICENCE_NO.DescriptionAttr(), data.DriverLicence?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER.DescriptionAttr(), vehicleOwner.Name?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_CITY.DescriptionAttr(), vehicleOwner.CityName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_PAN_NUMBER.DescriptionAttr(), vehicleOwner.PAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_MOBILE_NUMBER.DescriptionAttr(), vehicleOwner.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_MODEL.DescriptionAttr(), vehicleModel.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NUMBER.DescriptionAttr(), vehicle.VRN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_REGISTRATION_STATE.DescriptionAttr(), vehicle.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_CHASIS_NUMBER.DescriptionAttr(), vehicle.ChasisNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_ENGINE_NUMBER.DescriptionAttr(), vehicle.EngineNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_STATE_PERMIT_NUMBER.DescriptionAttr(), vehicle.StatePermitNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_STATE_PERMIT_EXP_DATE.DescriptionAttr(), vehicle.StatePermitExpiryString?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NATIONAL_PERMIT_NUMBER.DescriptionAttr(), vehicle.NationalPermitNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NATIONAL_PERMIT_EXP_DATE.DescriptionAttr(), vehicle.NationalPermitExpiryString?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_INSURANCE_POLICY_NUMBER.DescriptionAttr(), vehicle.InsuranceNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_INSURANCE_POLICY_EXP_DATE.DescriptionAttr(), vehicle.InsuranceExpiryString?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.AT_OWNER_RISK.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TERMS_AND_CONDITIONS.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubject?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LORRY_HIRE_FREIGHT.DescriptionAttr(), data.TaxableAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.ADVANCE_CASH.DescriptionAttr(), data.AdvanceCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.ADVANCE_NEFT.DescriptionAttr(), data.AdvanceNeft?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BALANCE.DescriptionAttr(), data.NetAmount?.ToString());
                string LR_Detail = "";
                int Total_Pkg = 0;
                decimal Total_weight = 0;
                decimal Total_Amount = 0;
                decimal Total_topayAmt = 0;
                decimal Total_tobbAmt = 0;
                decimal Total_paidAmt = 0;
                for (int i = 0; i < data.LRBookingList.Count; i++)
                {
                    Total_Pkg += Convert.ToInt32(data.LRBookingList[i].Parcel);
                    Total_weight += Convert.ToDecimal(data.LRBookingList[i].ChargeWeight);
                    Total_Amount += Convert.ToDecimal(data.LRBookingList[i].ChargeAmount);
                    Total_topayAmt += Convert.ToDecimal(data.LRBookingList[i].ToPayAmount);
                    Total_tobbAmt += Convert.ToDecimal(data.LRBookingList[i].TBBAmount);
                    Total_paidAmt += Convert.ToDecimal(data.LRBookingList[i].PaidAmount);
                    var LRDetailTemplate = Common.GetChalanLRDetailPrint();

                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.SR_NO.DescriptionAttr(), (i + 1).ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.L_R_NO.DescriptionAttr(), data.LRBookingList[i].LRNumber.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNEE_NAME.DescriptionAttr(), data.LRBookingList[i].Consignee?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNEE_GST.DescriptionAttr(), data.LRBookingList[i].ConsigneeGST?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNEE_MOBILE.DescriptionAttr(), data.LRBookingList[i].ConsigneeMobile?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNOR_NAME.DescriptionAttr(), data.LRBookingList[i].Consignor?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNOR_GST.DescriptionAttr(), data.LRBookingList[i].ConsignorGST?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CONSIGNOR_MOBILE.DescriptionAttr(), data.LRBookingList[i].ConsignorMobile?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.BILL_PARTY_NAME.DescriptionAttr(), data.LRBookingList[i].BillPartyName?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.BILL_PARTY_GST.DescriptionAttr(), data.LRBookingList[i].BillPartyGST?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.BILL_PARTY_MOBILE.DescriptionAttr(), data.LRBookingList[i].BillPartyMobile?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.PAY_TYPE.DescriptionAttr(), data.LRBookingList[i].LRPayType?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.PARCEL.DescriptionAttr(), data.LRBookingList[i].Parcel.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.DESCRIPTION.DescriptionAttr(), data.LRBookingList[i].Description?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.PACKING.DescriptionAttr(), data.LRBookingList[i].Packing?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.ACTUAL_WEIGHT.DescriptionAttr(), data.LRBookingList[i].ActualWeight?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.CHARGE_WEIGHT.DescriptionAttr(), data.LRBookingList[i].ChargeWeight?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.EWAY_BILL_NUMBER_PART_A.DescriptionAttr(), data.LRBookingList[i].EwayBillNo?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.PRIVATE_MARK.DescriptionAttr(), data.LRBookingList[i].PrivateMarka?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.LR_AMOUNT.DescriptionAttr(), data.LRBookingList[i].ChargeAmount?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.BOOKING_CITY.DescriptionAttr(), data.LRBookingList[i].CityFrom?.ToString());
                    LRDetailTemplate = LRDetailTemplate.Replace(ChalanPrintLRDetailVariables.DELIVERY_CITY.DescriptionAttr(), data.LRBookingList[i].CityTo?.ToString());
                    LR_Detail += LRDetailTemplate;
                }
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LR_DETAIL.DescriptionAttr(), LR_Detail);
                string Amount_Word =  Common.ConvertAmount(Convert.ToDouble(Total_Amount));

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.PAID_VALUE.DescriptionAttr(), Total_paidAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TBB_VALUE.DescriptionAttr(), Total_tobbAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL.DescriptionAttr(), Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_WEIGHT.DescriptionAttr(), Total_weight.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_AMOUNT.DescriptionAttr(), Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DESTINATION.DescriptionAttr(), data.LRBookingList[0].CityTo);
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_LR.DescriptionAttr(), data.LRBookingList.Count.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_PKGS.DescriptionAttr(), Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_TO_PAY_AMOUNT.DescriptionAttr(), Total_topayAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_PAID_TBB_AMOUNT.DescriptionAttr(), Total_tobbAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_CHARGE.DescriptionAttr(), data.CrossingAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.HAMALI.DescriptionAttr(), data.CrossingHamali?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_CHARGE.DescriptionAttr(), data.CrossingDeliveryCharge?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BALANCE_TYPE.DescriptionAttr(), data.ToPayAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.AMOUNT_IN_SENTENCE.DescriptionAttr(), Amount_Word);
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.NOTES.DescriptionAttr(), data.Notes?.ToString());
                
                result.ReportData.LRTemplate = LRTemplate;
            }
            catch (Exception ex)
            {

            }

            return View(result);
        }

        public IActionResult LRBookingChalanSummaryPrint()
        {
            var result = new ReportDataViewModel<LRBookingLRPrintModel>();
            try
            {
                result.ReportHeader = new ReportHeaderViewModel();
                result.ReportData = new LRBookingLRPrintModel();

                var id = int.Parse(HttpContext.Request.Query["id"].ToString());
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId);
                var vehicle = _vehicleRepo.Get(data.VehicleId, CurrentUserId, _configurationData.DefaultConnection);
                var vehicleOwner = _vehicleOwnerRepo.Get(vehicle.OwnerId, CurrentUserId, _configurationData.DefaultConnection);
                var vehicleModel = _vehicleModelRepository.Get(vehicle.ModelId, _configurationData.DefaultConnection);

                var CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.Get(data.BranchId, _configurationData.DefaultConnection) ?? new CustomerFirmBranchTransportSettingViewModel() { BranchId = id };

                var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
                var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
                result.ReportHeader.FrimName = currentFirm.Title.ToString();
                result.ReportHeader.BranchName = currentBranch.Title.ToString();
                result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

                var LRTemplate = CustomerFirmBranchTransportSetting.ChalanSummaryTemplate;
                if (LRTemplate == "0")
                {
                    LRTemplate = Common.GetChalanSummaryPrint();
                }
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_NAME.DescriptionAttr(), currentFirm.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_GST_TYPE.DescriptionAttr(), currentFirm.GSTFirmType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_AADHAR_UID.DescriptionAttr(), currentFirm.AdharUID?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_TYPE.DescriptionAttr(), currentFirm.FirmType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_OWNER.DescriptionAttr(), currentFirm.OwnerName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_TAN.DescriptionAttr(), currentFirm.TAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_IEC.DescriptionAttr(), currentFirm.IECCode?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_LUT_BOND.DescriptionAttr(), currentFirm.LutBondNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_BUSINESS.DescriptionAttr(), currentFirm.Business.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_GST_NO.DescriptionAttr(), currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_ADDRESS.DescriptionAttr(), currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString().Replace(" | ", ", "));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PHONE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_EMAIL_ADDRESS.DescriptionAttr(), currentBranch.Email?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_NAME.DescriptionAttr(), currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_TYPE.DescriptionAttr(), currentBranch.FirmBranchType?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PRINT_TITLE.DescriptionAttr(), currentBranch.PrintTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CODE.DescriptionAttr(), currentBranch.ShortTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_PAN_NO.DescriptionAttr(), currentBranch.PAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CITY.DescriptionAttr(), currentBranch.CityTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_TALUKA.DescriptionAttr(), currentBranch.TalukaTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_DISTRICT.DescriptionAttr(), currentBranch.DistrictTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_STATE.DescriptionAttr(), currentBranch.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_MOBILE_NO.DescriptionAttr(), currentBranch.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_ALTERNATE_MOBILE_NO.DescriptionAttr(), currentBranch.MobileAlternate?.ToString());
                
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.AT_OWNER_RISK.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TERMS_AND_CONDITIONS.DescriptionAttr(), CustomerFirmBranchTransportSetting.LRSubject?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_DATE.DescriptionAttr(), DateTime.Now.ToString("dd-MM-yyyy"));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_BRANCH.DescriptionAttr(), currentBranch.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DELIVERY_BRANCH.DescriptionAttr(), data.DeliveryBranch?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BILL_PURCHASE_PARTY.DescriptionAttr(), data.BillPartyName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BILL_PARTY.DescriptionAttr(), data.BillPartyName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.EWAY_BILL_NUMBER_PART_B.DescriptionAttr(), data.EwayBillNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.FIRM_CHALAN.DescriptionAttr(), data.BillNumberFirm?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BRANCH_CHALAN.DescriptionAttr(), data.BillNumberBranch.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_ACCOUNT_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.ToPayAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_AMOUNT.DescriptionAttr(), data.ToPayAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TO_PAY_ACCOUNT_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.ToPayAmountAccountBranchMappingChargerTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_VALUE.DescriptionAttr(), data.BillAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingAmountAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT.DescriptionAttr(), data.CrossingAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_AMOUNT_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingAmountAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingCommissionAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION.DescriptionAttr(), data.CrossingCommission?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_COMMISION_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingCommissionAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingHamaliAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI.DescriptionAttr(), data.CrossingHamali?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_HAMALI_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingHamaliAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING.DescriptionAttr(), CustomerFirmBranchTransportSetting.CrossingDeliveryChargeAccountName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE.DescriptionAttr(), data.CrossingDeliveryCharge?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING_CHARGED_TO.DescriptionAttr(), data.CrossingDeliveryAccountBranchMappingChargedTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BROKER.DescriptionAttr(), data.BrokerName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BROKRAGE.DescriptionAttr(), data.BrokerAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.REMARKS.DescriptionAttr(), data.Notes?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LORRY_HIRE_FREIGHT.DescriptionAttr(), data.TaxableAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LESS_TDS_P.DescriptionAttr(), data.TDSPercent?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LESS_TDS_AMOUNT.DescriptionAttr(), data.TDSAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CASH_TO_LORRY_TRIP.DescriptionAttr(), data.AdvanceCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BANK_TRANSFER_TO_LORRY_TRIP.DescriptionAttr(), data.AdvanceNeft?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.RECEIVED_CASH_BY_DRIVER.DescriptionAttr(), data.ReceiveCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.OTHER_EXP_OF_TRIP.DescriptionAttr(), data.OtherPlus?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.OTHER_LESS.DescriptionAttr(), data.OtherLess?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_NET_AMOUNT.DescriptionAttr(), data.NetAmount?.ToString());

                string NET_AMOUNT = Common.ConvertAmount(Convert.ToDouble(data.NetAmount?.ToString()));
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CHALAN_AMOUNT_IN_WORDS.DescriptionAttr(), NET_AMOUNT);
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOK_NAME.DescriptionAttr(), data.CustomerBook?.BookName?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CITY.DescriptionAttr(), data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_CITY.DescriptionAttr(), data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DELIVERY_CITY.DescriptionAttr(), data.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_NAME.DescriptionAttr(), data.DriverName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_ADDRESS.DescriptionAttr(), data.DriverAddress?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DRIVER_LICENCE_NO.DescriptionAttr(), data.DriverLicence?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER.DescriptionAttr(), vehicleOwner.Name?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_CITY.DescriptionAttr(), vehicleOwner.CityName?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_PAN_NUMBER.DescriptionAttr(), vehicleOwner.PAN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_OWNER_MOBILE_NUMBER.DescriptionAttr(), vehicleOwner.Mobile?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_MODEL.DescriptionAttr(), vehicleModel.Title?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NUMBER.DescriptionAttr(), vehicle.VRN?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_REGISTRATION_STATE.DescriptionAttr(), vehicle.StateTitle?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_CHASIS_NUMBER.DescriptionAttr(), vehicle.ChasisNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_ENGINE_NUMBER.DescriptionAttr(), vehicle.EngineNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_STATE_PERMIT_NUMBER.DescriptionAttr(), vehicle.StatePermitNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_STATE_PERMIT_EXP_DATE.DescriptionAttr(), vehicle.StatePermitExpiryString?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NATIONAL_PERMIT_NUMBER.DescriptionAttr(), vehicle.NationalPermitNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_NATIONAL_PERMIT_EXP_DATE.DescriptionAttr(), vehicle.NationalPermitExpiryString?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_INSURANCE_POLICY_NUMBER.DescriptionAttr(), vehicle.InsuranceNumber?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.VEHICLE_INSURANCE_POLICY_EXP_DATE.DescriptionAttr(), vehicle.InsuranceExpiryString?.ToString());

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.LORRY_HIRE_FREIGHT.DescriptionAttr(), data.TaxableAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.ADVANCE_CASH.DescriptionAttr(), data.AdvanceCash?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.ADVANCE_NEFT.DescriptionAttr(), data.AdvanceNeft?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BALANCE.DescriptionAttr(), data.NetAmount?.ToString());
                int Total_Pkg = 0;
                decimal Total_weight = 0;
                decimal Total_Amount = 0;
                decimal Total_topayAmt = 0;
                decimal Total_tobbAmt = 0;
                for (int i = 0; i < data.LRBookingList.Count; i++)
                {
                    Total_Pkg += Convert.ToInt32(data.LRBookingList[i].Parcel);
                    Total_weight += Convert.ToDecimal(data.LRBookingList[i].ChargeWeight);
                    Total_Amount += Convert.ToDecimal(data.LRBookingList[i].ChargeAmount);
                    Total_topayAmt += Convert.ToDecimal(data.LRBookingList[i].ToPayAmount);
                    Total_tobbAmt += Convert.ToDecimal(data.LRBookingList[i].TBBAmount);

                }
                string Amount_Word = Common.ConvertAmount(Convert.ToDouble(Total_Amount));

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL.DescriptionAttr(), Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL.DescriptionAttr(), Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_WEIGHT.DescriptionAttr(), Total_weight.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_AMOUNT.DescriptionAttr(), Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.DESTINATION.DescriptionAttr(), data.LRBookingList[0].CityTo);
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_LR.DescriptionAttr(), data.LRBookingList.Count.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_PKGS.DescriptionAttr(), Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_TO_PAY_AMOUNT.DescriptionAttr(), Total_topayAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.TOTAL_PAID_TBB_AMOUNT.DescriptionAttr(), Total_tobbAmt.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.CROSSING_CHARGE.DescriptionAttr(), data.CrossingAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.HAMALI.DescriptionAttr(), data.CrossingHamali?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BOOKING_CHARGE.DescriptionAttr(), data.CrossingDeliveryCharge?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.BALANCE_TYPE.DescriptionAttr(), data.ToPayAmount?.ToString());
                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.AMOUNT_IN_SENTENCE.DescriptionAttr(), Amount_Word);

                LRTemplate = LRTemplate.Replace(ChalanPrintVariables.NOTES.DescriptionAttr(), data.Notes?.ToString());                


                result.ReportData.LRTemplate = LRTemplate;
            }
            catch (Exception ex)
            {

            }

            return View(result);
        }
    }
}