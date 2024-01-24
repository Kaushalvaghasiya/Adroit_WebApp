using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Globalization;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRBookingStockRegister()
        {
            LRBookingStockRegisterViewModel model = new LRBookingStockRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.InvStatusList = GenericHelper.GetInvoiceStatusList();
            model.ChalanList = GenericHelper.GetChalanList();
            model.LRStatusList = GenericHelper.GetBookingLRStatusList();
            return View(model);
        }

        [Route("~/CustomerReport/LRBookingStockRegisterReportList/{branchIds}/{dateFrom}/{dateTo}/{cityToIds}/{cityFromIds}/{consignorIds}/{consigneeIds}/{billPartyIds}/{payTypeIds}/{chalanId}/{invStatusId}")]
        public JsonResult LRBookingStockRegisterReportList(LRBookingStockRegisterViewModel model, int draw = 0, int start = 0, int length = 10, string branchIds = "", string dateFrom = "", string dateTo = "", string cityToIds = "", string cityFromIds = "", string consignorIds = "", string consigneeIds = "", string billPartyIds = "", string payTypeIds = "", int chalanId = 0, int invStatusId = 0)
        {
            var result = new DataTableListViewModel<LRBookingStockRegisterGridViewModel>();
            try
            {
                HttpContext.Session.SetString("LRBookingStockRegisterReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingStockRegisterRepository.GetList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingStockRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [Route("~/CustomerReport/LRBookingStockRegisterReportListWithSummary/{branchIds}/{dateFrom}/{dateTo}/{cityFromIds}/{cityToIds}/{consignorIds}/{consigneeIds}/{billPartyIds}/{payTypeIds}/{chalanId}/{invStatusId}")]
        public JsonResult LRBookingStockRegisterReportListWithSummary(LRBookingStockRegisterViewModel model, int draw = 0, int start = 0, int length = 10, string branchIds = "", string dateFrom = "", string dateTo = "", string cityFromIds = "", string cityToIds = "", string consignorIds = "", string consigneeIds = "", string billPartyIds = "", string payTypeIds = "", int chalanId = 0, int invStatusId = 0)
        {
            var result = new DataTableListViewModel<LRBookingStockRegisterGridViewModel>();
            try
            {
                HttpContext.Session.SetString("LRBookingStockRegisterReportListWithSummary", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingStockRegisterRepository.GetListWithSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingStockRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }   
        public IActionResult LRBookingStockRegisterPrint()
        {
            var result = new ReportDataViewModel<List<LRBookingStockRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingStockRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingStockRegisterReportList"));

            result.ReportData = _reportLRBookingStockRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingStockRegisterPrintSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingStockRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingStockRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingStockRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingStockRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
    }
}