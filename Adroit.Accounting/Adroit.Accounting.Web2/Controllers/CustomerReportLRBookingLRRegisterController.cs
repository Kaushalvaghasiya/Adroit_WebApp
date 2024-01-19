using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Globalization;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRBookingLRRegister()
        {
            LRBookingLRRegisterViewModel model = new LRBookingLRRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetViewList();
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PvtMarkList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.PrivateMarka);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.InvStatusList = GenericHelper.GetBookingLRInvoiceStatusList();
            model.ChalanList = GenericHelper.GetChalanList();
            model.LRStatusList = GenericHelper.GetBookingLRStatusList();

            return View(model);
        }

        [Route("~/CustomerReport/LRBookingLRRegisterReportList")]
        public JsonResult LRBookingLRRegisterReportList(LRBookingLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingLRRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingLRRegisterReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingLRRegisterRepository.GetList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingLRRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [Route("~/CustomerReport/LRBookingLRRegisterReportListWithSummary")]
        public JsonResult LRBookingLRRegisterReportListWithSummary(LRBookingLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingLRRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingLRRegisterReportListWithSummary", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingLRRegisterRepository.GetListWithSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingLRRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public IActionResult LRBookingLRRegisterPrintDateWise()
        {
            var result = new ReportDataViewModel<List<LRBookingLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));

            result.ReportData = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintDateWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintLRWise()
        {
            var result = new ReportDataViewModel<List<LRBookingLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));

            result.ReportData = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintPartyWise()
        {
            var result = new ReportDataViewModel<List<LRBookingLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));

            result.ReportData = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintPartyWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
    }
}
