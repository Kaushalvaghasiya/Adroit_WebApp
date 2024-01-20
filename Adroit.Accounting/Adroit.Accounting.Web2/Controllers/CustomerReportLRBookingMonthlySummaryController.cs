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
        public IActionResult LRBookingMonthlySummary()
        {
            LRBookingMonthlySummaryViewModel model = new LRBookingMonthlySummaryViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            return View(model);
        }

        [HttpGet]
        public JsonResult LRBookingMonthlySummaryReportList(LRBookingMonthlySummaryViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingMonthlySummaryGridViewModel>();
            try
            {
                HttpContext.Session.SetString("LRBookingMonthlySummaryReportList", JsonConvert.SerializeObject(model));
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingMonthlySummaryRepository.SelectList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingMonthlySummaryGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public IActionResult LRBookingMonthlySummaryReportPrint()
        {
            var result = new ReportDataViewModel<List<LRBookingMonthlySummaryGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();            
            var parameters = JsonConvert.DeserializeObject<LRBookingMonthlySummaryGridViewModel>(HttpContext.Session.GetString("LRBookingMonthlySummaryReportList"));

            result.ReportData = _reportLRBookingMonthlySummaryRepository.SelectList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();
            return View(result);
        }
    }
}