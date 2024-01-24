using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRBookingDailySummary()
        {
            LRBookingDailySummaryViewModel model = new LRBookingDailySummaryViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.LRStatusList = GenericHelper.GetBookingLRStatusList();
            return View(model);
        }

        [HttpGet]
        public JsonResult LRBookingDailySummaryReportList(LRBookingDailySummaryViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingDailySummaryGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingDailySummaryReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingDailySummaryRepository.SelectList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingDailySummaryGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public IActionResult LRBookingDailySummaryReportPrint()
        {
            var result = new ReportDataViewModel<List<LRBookingDailySummaryGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingDailySummaryGridViewModel>(HttpContext.Session.GetString("LRBookingDailySummaryReportList"));

            result.ReportData = _reportLRBookingDailySummaryRepository.SelectList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
    }
}