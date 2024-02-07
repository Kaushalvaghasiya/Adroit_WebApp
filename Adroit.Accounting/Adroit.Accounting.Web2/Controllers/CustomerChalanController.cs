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
                LRTemplate = LRTemplate.Replace("[COMPANY_NAME]", currentFirm.Title.ToString());
                LRTemplate = LRTemplate.Replace("[TRA_GST_NO]", currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace("[ADDRESS]", currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString());
                LRTemplate = LRTemplate.Replace("[PHONE_NUMBER]", currentBranch.Mobile.ToString());
                LRTemplate = LRTemplate.Replace("[COMPANY_EMAIL]", currentBranch.Email?.ToString());
 
                LRTemplate = LRTemplate.Replace("[DATE]", DateTime.Now.ToString("dd-MM-yyyy"));
                
                LRTemplate = LRTemplate.Replace("[AT_OWNER_RISK]", CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace("[SUBJECT_TO]", CustomerFirmBranchTransportSetting.LRSubject?.ToString());
                
                LRTemplate = LRTemplate.Replace("[CITY]", data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace("[TRUCK_NO]", data.VehicleVRN);
                LRTemplate = LRTemplate.Replace("[CHALAN_NO]", "[CHALAN_NO]");
                LRTemplate = LRTemplate.Replace("[FROM_CITY]", data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace("[TO_CITY]", data.CityTo?.ToString());
                LRTemplate = LRTemplate.Replace("[TRUCK_FREIGHT]", "[TRUCK_FREIGHT]");
                LRTemplate = LRTemplate.Replace("[ADV_CASH]", data.AdvanceCash.ToString());
                LRTemplate = LRTemplate.Replace("[ADV_NEFT]", data.AdvanceNeft.ToString());
                LRTemplate = LRTemplate.Replace("[BALANCE]", "[BALANCE]");
                string LR_Detail = "";
                int Total_Pkg = 0;
                decimal Total_weight = 0;
                decimal Total_Amount = 0;
                for (int i = 0; i < data.LRBookingList.Count; i++)
                {
                    Total_Pkg += Convert.ToInt32(data.LRBookingList[i].Parcel);
                    Total_weight += Convert.ToDecimal(data.LRBookingList[i].ChargeWeight);
                    Total_Amount += Convert.ToDecimal(data.LRBookingList[i].ChargeAmount);
                    LR_Detail += "<tr> <td style='text-align: center;'> "+ (i+1) + " </td><td style='text-align: center;'>"+ data.LRBookingList[i].LRNumber + "</td><td style='text-align: center;'> " + data.LRBookingList[i].Parcel + " </td>"
                        + "<td style='text-align: center;'>" + data.LRBookingList[i].Description + " </td><td style='text-align: right;'>" + data.LRBookingList[i].ChargeWeight + " </td><td style='text-align: center;'> " + data.LRBookingList[i].CityFrom + " </td>"
                        + "<td style='text-align: center;'> " + data.LRBookingList[i].CityTo + " </td><td style='text-align: center;'> " + data.LRBookingList[i].PrivateMarka + " </td><td style='text-align: center;'> " + data.LRBookingList[i].Consignor + " </td>"
                        + "<td style='text-align: center;'> " + data.LRBookingList[i].LRPayType + " </td><td style='text-align: right'> " + data.LRBookingList[i].ChargeAmount + " </td></tr>";
                }

                LRTemplate = LRTemplate.Replace("[LR_DETAIL]", LR_Detail);
                string Amount_Word =  Common.ConvertAmount(Convert.ToDouble(Total_Amount));


                LRTemplate = LRTemplate.Replace("[TOTAL]", Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace("[TOTAL_WEIGHT]", Total_weight.ToString());
                LRTemplate = LRTemplate.Replace("[TOTAL_AMOUNT]", Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace("[DESTINATION]", data.LRBookingList[0].CityTo);
                LRTemplate = LRTemplate.Replace("[TOTAL_LR]", data.LRBookingList.Count.ToString());
                LRTemplate = LRTemplate.Replace("[TOTAL_PKGS]", Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace("[TOTAL_WEIGHT]", Total_weight.ToString());
                LRTemplate = LRTemplate.Replace("[TOTAL_TO_PAY_AMOUNT]", "[TOTAL_TO_PAY_AMOUNT]");
                LRTemplate = LRTemplate.Replace("[PAID_TBB_AMOUNT]", "[PAID_TBB_AMOUNT]");
                LRTemplate = LRTemplate.Replace("[TOTAL_AMOUNT]", Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace("[F_TOTAL_LR]", data.LRBookingList.Count.ToString());
                LRTemplate = LRTemplate.Replace("[F_TOTAL_PKGS]", Total_Pkg.ToString());
                LRTemplate = LRTemplate.Replace("[F_TOTAL_WEIGHT]", Total_weight.ToString());
                LRTemplate = LRTemplate.Replace("[F_TOT_TO_PAY_AMO]", "[F_TOT_TO_PAY_AMO]");
                LRTemplate = LRTemplate.Replace("[F_PAID_TBB_AMOUNT]", "[F_PAID_TBB_AMOUNT]");
                LRTemplate = LRTemplate.Replace("[F_TOTAL_AMOUNT]", Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace("[CROSSING_CHARGE]", data.CrossingAmount?.ToString());
                LRTemplate = LRTemplate.Replace("[HAMALI]", data.CrossingHamali?.ToString());
                LRTemplate = LRTemplate.Replace("[BOOKING_CHARGE]", data.CrossingDeliveryCharge?.ToString());
                LRTemplate = LRTemplate.Replace("[BALANCE_TYPE]", data.ToPayAmount?.ToString());
                LRTemplate = LRTemplate.Replace("[AMOUNT_IN_SENTENCE]", Amount_Word);
                LRTemplate = LRTemplate.Replace("[NOTES]", data.Notes?.ToString());
                
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
                LRTemplate = LRTemplate.Replace("[COMPANY_NAME]", currentFirm.Title.ToString());
                LRTemplate = LRTemplate.Replace("[TRA_GST_NO]", currentBranch.GSTNumber.ToString());
                LRTemplate = LRTemplate.Replace("[ADDRESS]", currentBranch.Address1?.ToString() + " " + currentBranch.Address2?.ToString() + " " + currentBranch.Address3?.ToString() + " " + currentBranch.CityName.ToString());
                LRTemplate = LRTemplate.Replace("[PHONE_NUMBER]", currentBranch.Mobile.ToString());
                LRTemplate = LRTemplate.Replace("[COMPANY_EMAIL]", currentBranch.Email?.ToString());
 
                LRTemplate = LRTemplate.Replace("[DATE]", DateTime.Now.ToString("dd-MM-yyyy"));

                LRTemplate = LRTemplate.Replace("[AT_OWNER_RISK]", CustomerFirmBranchTransportSetting.LRSubTitle?.ToString());
                LRTemplate = LRTemplate.Replace("[SUBJECT_TO]", CustomerFirmBranchTransportSetting.LRSubject?.ToString());

                LRTemplate = LRTemplate.Replace("[CITY]", data.CityFrom?.ToString());
                
                LRTemplate = LRTemplate.Replace("[FROM_CITY]", data.CityFrom?.ToString());
                LRTemplate = LRTemplate.Replace("[TO_CITY]", data.CityTo?.ToString());
                 
                
                decimal Total_Amount = 0;
                for (int i = 0; i < data.LRBookingList.Count; i++)
                {
                    
                    Total_Amount += Convert.ToDecimal(data.LRBookingList[i].ChargeAmount);
                     
                }
 

                LRTemplate = LRTemplate.Replace("[TOTAL]", Total_Amount.ToString());
                LRTemplate = LRTemplate.Replace("[BILL_PARTY]", "[BILL_PARTY]");
                LRTemplate = LRTemplate.Replace("[TRUCK_NO]", data.VehicleVRN);
                LRTemplate = LRTemplate.Replace("[BRANCH]", data.BranchName);
                LRTemplate = LRTemplate.Replace("[BROKER]", "[TOTAL_WEIGHT]");
                LRTemplate = LRTemplate.Replace("[DRIVER_NAME]", data.DriverName);
                LRTemplate = LRTemplate.Replace("[DRIVER_ADDRESS]", data.DriverAddress);
                LRTemplate = LRTemplate.Replace("[LIC_NO]",data.LicenceNumber);
                LRTemplate = LRTemplate.Replace("[OWNER_NAME]", "[OWNER_NAME]");
                LRTemplate = LRTemplate.Replace("[PAN_NO]", "[PAN_NO]");
                LRTemplate = LRTemplate.Replace("[MOB]", data.DriverMobile);
                LRTemplate = LRTemplate.Replace("[ENGINE_NO]", data.EngineNumber);
                LRTemplate = LRTemplate.Replace("[CHASIS_NO]",data.ChasisNumber);
                LRTemplate = LRTemplate.Replace("[PERMIT_NO]",data.NationalPermitNumber);
                LRTemplate = LRTemplate.Replace("[PER_UP_TO]", "[PER_UP_TO]");
                LRTemplate = LRTemplate.Replace("[POLICY_NO]", data.InsuranceNumber);
                LRTemplate = LRTemplate.Replace("[UP_To]", "[UP_To]");
                
                LRTemplate = LRTemplate.Replace("[TRUCK_FREIGHT]", "[TRUCK_FREIGHT]");
                LRTemplate = LRTemplate.Replace("[LESS_TDS]", data.TDSAmount.ToString());
                LRTemplate = LRTemplate.Replace("[ADVANCE_CASH]", data.AdvanceCash.ToString());
                LRTemplate = LRTemplate.Replace("[ADVANCE_NEFT]", data.AdvanceNeft.ToString());
                LRTemplate = LRTemplate.Replace("[OTHER]", "[OTHER]");
                LRTemplate = LRTemplate.Replace("[RECEIVE_CASH]", "[RECEIVE_CASH]");
                LRTemplate = LRTemplate.Replace("[OTHER_EXP]", "[OTHER_EXP]");
                LRTemplate = LRTemplate.Replace("[BALANCE]", "[BALANCE]");
                 
                
                LRTemplate = LRTemplate.Replace("[NOTES]", data.Notes?.ToString());



                result.ReportData.LRTemplate = LRTemplate;
            }
            catch (Exception ex)
            {

            }

            return View(result);
        }
    }
}