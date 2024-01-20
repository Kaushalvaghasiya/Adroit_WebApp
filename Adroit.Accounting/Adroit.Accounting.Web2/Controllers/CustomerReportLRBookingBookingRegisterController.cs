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
        public IActionResult LRBookingBookingRegister()
        {
            LRBookingBookingRegisterViewModel model = new LRBookingBookingRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetBookingReportViewList();
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.InvStatusList = GenericHelper.GetInvoiceStatusList();
            model.ChalanList = GenericHelper.GetChalanList();

            return View(model);
        }

        [Route("~/CustomerReport/LRBookingBookingRegisterReportList")]
        public JsonResult LRBookingBookingRegisterReportList(LRBookingBookingRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingBookingRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingBookingRegisterReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingBookingRegisterRepository.GetList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingBookingRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [Route("~/CustomerReport/LRBookingBookingRegisterReportListWithSummary")]
        public JsonResult LRBookingBookingRegisterReportListWithSummary(LRBookingBookingRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingBookingRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRBookingBookingRegisterReportListWithSummary", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingBookingRegisterRepository.GetListWithSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingBookingRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public IActionResult LRBookingBookingRegisterPrintDateWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintLRWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintCityWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintCityWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintConsigneeWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintConsigneeWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintConsignorWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintConsignorWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintBillPartyWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportListWithSummary"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
        public IActionResult LRBookingBookingRegisterPrintBillPartyWise()
        {
            var result = new ReportDataViewModel<List<LRBookingBookingRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRBookingBookingRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingBookingRegisterReportList"));

            result.ReportData = _reportLRBookingBookingRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
    }
}