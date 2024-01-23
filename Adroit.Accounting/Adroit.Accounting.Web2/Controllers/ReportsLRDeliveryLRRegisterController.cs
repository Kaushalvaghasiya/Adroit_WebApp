using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRDeliveryLRRegister()
        {
            LRDeliveryLRRegisterViewModel model = new LRDeliveryLRRegisterViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetViewList();
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.ConsignorList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.ConsigneeList = model.ConsignorList;
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PvtMarkList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.PrivateMarka);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.InvStatusList = GenericHelper.GetInvoiceStatusList();
            model.VehicleNumberList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.LRViewList = GenericHelper.GetLRViewList();
            model.ChalanList = _chalanRepository.GetChalanListByBranchId_Select(_configurationData.DefaultConnection, CurrentBranchId);
            model.LRStatusList = GenericHelper.GetBookingLRStatusList();
            return View(model);
        }
        [Route("~/CustomerReport/LRDeliveryLRRegisterReportList")]
        public JsonResult LRDeliveryLRRegisterReportList(LRDeliveryLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRDeliveryLRRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRDeliveryLRRegisterReportList", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRDeliveryLRRegisterRepository.GetList(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRDeliveryLRRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [Route("~/CustomerReport/LRDeliveryLRRegisterReportListWithSummary")]
        public JsonResult LRDeliveryLRRegisterReportListWithSummary(LRDeliveryLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRDeliveryLRRegisterGridViewModel>();
            try
            {
                //save to session
                HttpContext.Session.SetString("LRDeliveryLRRegisterReportListWithSummary", JsonConvert.SerializeObject(model));

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRDeliveryLRRegisterRepository.GetListWithSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRDeliveryLRRegisterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public IActionResult LRDeliveryLRRegisterPrintDateWise()
        {
            var result = new ReportDataViewModel<List<LRDeliveryLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRDeliveryLRRegisterGridViewModel>(HttpContext.Session.GetString("LRDeliveryLRRegisterReportList"));

            result.ReportData = _reportLRDeliveryLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRDeliveryLRRegisterPrintDateWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRDeliveryLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRDeliveryLRRegisterGridViewModel>(HttpContext.Session.GetString("LRDeliveryLRRegisterReportListWithSummary"));

            result.ReportData = _reportLRDeliveryLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRDeliveryLRRegisterPrintLRWise()
        {
            var result = new ReportDataViewModel<List<LRDeliveryLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRDeliveryLRRegisterGridViewModel>(HttpContext.Session.GetString("LRDeliveryLRRegisterReportList"));

            result.ReportData = _reportLRDeliveryLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRDeliveryLRRegisterPrintPartyWise()
        {
            var result = new ReportDataViewModel<List<LRDeliveryLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRDeliveryLRRegisterGridViewModel>(HttpContext.Session.GetString("LRDeliveryLRRegisterReportList"));

            result.ReportData = _reportLRDeliveryLRRegisterRepository.GetList(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }

        public IActionResult LRDeliveryLRRegisterPrintPartyWiseSummary()
        {
            var result = new ReportDataViewModel<List<LRDeliveryLRRegisterGridViewModel>>();
            result.ReportHeader = new ReportHeaderViewModel();
            result.ReportHeader.Subtotal = bool.TryParse(HttpContext.Request.Query["SubTotal"], out bool subtotalValue) ? subtotalValue : false;
            result.ReportHeader.DateFrom = DateTime.Parse(HttpContext.Request.Query["DateFrom"].ToString());
            result.ReportHeader.DateTo = DateTime.Parse(HttpContext.Request.Query["DateTo"].ToString());
            var parameters = JsonConvert.DeserializeObject<LRDeliveryLRRegisterGridViewModel>(HttpContext.Session.GetString("LRDeliveryLRRegisterReportListWithSummary"));

            result.ReportData = _reportLRDeliveryLRRegisterRepository.GetListWithSummary(parameters, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, pageSize: -1).ToList();
            var currentFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            result.ReportHeader.FrimName = currentFirm.Title.ToString();
            result.ReportHeader.BranchName = currentBranch.Title.ToString();
            result.ReportHeader.BranchAddress = currentBranch.Address1.ToString();

            return View(result);
        }
    }
}