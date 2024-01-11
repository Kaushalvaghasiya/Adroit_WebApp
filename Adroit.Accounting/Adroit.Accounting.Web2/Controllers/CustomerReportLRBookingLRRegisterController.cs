using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

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
            bool subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            string Datefrom = HttpContext.Request.Query["DateFrom"].ToString();
            string Dateto = HttpContext.Request.Query["DateTo"].ToString();
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));
            var result = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            ViewBag.SubTotal = subtotal;
            ViewBag.DateFrom = Datefrom;
            ViewBag.DateTo = Dateto;
            ViewBag.CurrentFimName = currentFirm.Title.ToString();

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintDateWiseSummary()
        {
            bool subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportListWithSummary"));
            var result = _reportLRBookingLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
            ViewBag.SubTotal = subtotal;

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintLRWise()
        {
            bool subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));
            var result = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
            ViewBag.SubTotal = subtotal;

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintPartyWise()
        {
            bool subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportList"));
            var result = _reportLRBookingLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
            ViewBag.SubTotal = subtotal;

            return View(result);
        }

        public IActionResult LRBookingLRRegisterPrintPartyWiseSummary()
        {
            bool subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            var parameters = JsonConvert.DeserializeObject<LRBookingLRRegisterGridViewModel>(HttpContext.Session.GetString("LRBookingLRRegisterReportListWithSummary"));
            var result = _reportLRBookingLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId).ToList();
            ViewBag.SubTotal = subtotal;

            return View(result);
        }
    }
}
