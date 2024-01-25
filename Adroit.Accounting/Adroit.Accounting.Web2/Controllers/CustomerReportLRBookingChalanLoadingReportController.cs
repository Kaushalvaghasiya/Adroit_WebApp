using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRBookingChalanLoadingReport()
        {
            LRBookingChalanLoadingReportViewModel model = new LRBookingChalanLoadingReportViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetChalanViewList();
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);

            return View(model);
        }
        [Route("~/CustomerReport/LRBookingChalanLoadingReportList")]
        public JsonResult LRBookingChalanLoadingReportList(LRBookingChalanLoadingReportViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingChalanLoadingGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingChalanLoadingReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingChalanLoadingReportRepository.GetList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingChalanLoadingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [Route("~/CustomerReport/LRBookingChalanLoadingReportListWithSummary")]
        public JsonResult LRBookingChalanLoadingReportListWithSummary(LRBookingChalanLoadingReportViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingChalanLoadingGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingChalanLoadingReportListWithSummary", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingChalanLoadingReportRepository.GetListWithSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingChalanLoadingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public IActionResult LRBookingChalanLoadingPrintDateWise()
        {
            var result = new ReportDataViewModel<List<LRBookingChalanLoadingGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingChalanLoadingGridViewModel>(HttpContext.Session.GetString("LRBookingChalanLoadingReportList"));

            result.ReportData = _reportLRBookingChalanLoadingReportRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingChalanLoadingPrintDateWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingChalanLoadingGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingChalanLoadingGridViewModel>(HttpContext.Session.GetString("LRBookingChalanLoadingReportListWithSummary"));

            result.ReportData = _reportLRBookingChalanLoadingReportRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingChalanLoadingPrintTruckWise()
        {
            var result = new ReportDataViewModel<List<LRBookingChalanLoadingGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingChalanLoadingGridViewModel>(HttpContext.Session.GetString("LRBookingChalanLoadingReportList"));

            result.ReportData = _reportLRBookingChalanLoadingReportRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingChalanLoadingPrintTruckWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingChalanLoadingGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingChalanLoadingGridViewModel>(HttpContext.Session.GetString("LRBookingChalanLoadingReportListWithSummary"));

            result.ReportData = _reportLRBookingChalanLoadingReportRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        //[HttpGet]
        //public JsonResult LRBookingChalanLoadingReportList1(int draw = 0, int start = 0, int length = 10)
        //{
        //    var result = new DataTableListViewModel<PurchaseBillMasterGridViewModel>();
        //    try
        //    {
        //        var search = Request.Query["search[value]"];
        //        var sortColumn = int.Parse(Request.Query["order[0][column]"]);
        //        var sortDirection = Request.Query["order[0][dir]"];

        //        var records = _reportLRBookingChalanLoadingReportRepository.SelectList(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
        //        result.data = records;
        //        result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
        //        result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = new List<PurchaseBillMasterGridViewModel>();
        //        result.recordsTotal = 0;
        //        result.recordsFiltered = 0;
        //    }
        //    return Json(result);
        //}

    }
}