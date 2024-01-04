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

        [Route("~/CustomerReport/LRBookingLRRegisterReportListWithoutSummary/{branchIds}/{dateFrom}/{dateTo}/{lrFrom}/{lrTo}/{cityFromIds}/{cityToIds}/{consignorIds}/{consigneeIds}/{billPartyIds}/{payTypeIds}/{pvtMarkIds}/{chalanId}/{invStatusId}")]
        public JsonResult LRBookingLRRegisterReportListWithoutSummary(LRBookingLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10, string branchIds = "", string dateFrom = "", string dateTo = "", int lrFrom = 0, int lrTo = 0, string cityFromIds = "", string cityToIds = "", string consignorIds = "", string consigneeIds = "", string billPartyIds = "", string payTypeIds = "", string pvtMarkIds = "", int chalanId = 0, int invStatusId = 0)
        {
            var result = new DataTableListViewModel<LRBookingLRRegisterGridViewModel>();
            try
            {
                model.BranchIds = branchIds;
                model.DateFrom = dateFrom;
                model.DateTo = dateTo;
                model.LRFrom = lrFrom;
                model.LRTo = lrTo;
                model.CityFromIds = cityFromIds;
                model.CityToIds = cityToIds;
                model.ConsignorIds = consignorIds;
                model.ConsigneeIds = consigneeIds;
                model.BillPartyIds = billPartyIds;
                model.PayTypeIds = payTypeIds;
                model.PvtMarkIds = pvtMarkIds;
                model.ChalanId = chalanId;
                model.InvStatusId = invStatusId;

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingLRRegisterRepository.GetListWithoutSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/CustomerReport/LRBookingLRRegisterReportListWithSummary/{selectedView}/{branchIds}/{dateFrom}/{dateTo}/{lrFrom}/{lrTo}/{cityFromIds}/{cityToIds}/{consignorIds}/{consigneeIds}/{billPartyIds}/{payTypeIds}/{pvtMarkIds}/{chalanId}/{invStatusId}")]
        public JsonResult LRBookingLRRegisterReportListWithSummary(LRBookingLRRegisterViewModel model, int draw = 0, int start = 0, int length = 10, string selectedView = "", string branchIds = "", string dateFrom = "", string dateTo = "", int lrFrom = 0, int lrTo = 0, string cityFromIds = "", string cityToIds = "", string consignorIds = "", string consigneeIds = "", string billPartyIds = "", string payTypeIds = "", string pvtMarkIds = "", int chalanId = 0, int invStatusId = 0)
        {
            var result = new DataTableListViewModel<LRBookingLRRegisterGridViewModel>();
            try
            {
                model.SelectedView = selectedView;
                model.BranchIds = branchIds;
                model.DateFrom = dateFrom;
                model.DateTo = dateTo;
                model.LRFrom = lrFrom;
                model.LRTo = lrTo;
                model.CityFromIds = cityFromIds;
                model.CityToIds = cityToIds;
                model.ConsignorIds = consignorIds;
                model.ConsigneeIds = consigneeIds;
                model.BillPartyIds = billPartyIds;
                model.PayTypeIds = payTypeIds;
                model.PvtMarkIds = pvtMarkIds;
                model.ChalanId = chalanId;
                model.InvStatusId = invStatusId;

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

    }
}
