using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

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
            return View(model);
        }

        [Route("~/CustomerReport/LRBookingStockRegisterReportListWithoutSummary/{branchIds}/{dateFrom}/{dateTo}/{cityToIds}/{cityFromIds}/{consignorIds}/{consigneeIds}/{billPartyIds}/{payTypeIds}/{chalanId}/{invStatusId}")]
        public JsonResult LRBookingStockRegisterReportListWithoutSummary(LRBookingStockRegisterViewModel model, int draw = 0, int start = 0, int length = 10, string branchIds = "", string dateFrom = "", string dateTo = "", string cityToIds = "", string cityFromIds = "", string consignorIds = "", string consigneeIds = "", string billPartyIds = "", string payTypeIds = "", int chalanId = 0, int invStatusId = 0)
        {
            var result = new DataTableListViewModel<LRBookingStockRegisterGridViewModel>();
            try
            {
                model.BranchIds = branchIds;
                model.DateFrom = dateFrom;
                model.DateTo = dateTo;
                model.CityFromIds = cityFromIds;
                model.CityToIds = cityToIds;
                model.ConsignorIds = consignorIds;
                model.ConsigneeIds = consigneeIds;
                model.BillPartyIds = billPartyIds;
                model.PayTypeIds = payTypeIds;
                model.ChalanId = chalanId;
                model.InvStatusId = invStatusId;

                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingStockRegisterRepository.GetListWithoutSummary(model, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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
                model.BranchIds = branchIds;
                model.DateFrom = dateFrom;
                model.DateTo = dateTo;
                model.CityFromIds = cityFromIds;
                model.CityToIds = cityToIds;
                model.ConsignorIds = consignorIds;
                model.ConsigneeIds = consigneeIds;
                model.BillPartyIds = billPartyIds;
                model.PayTypeIds = payTypeIds;
                model.ChalanId = chalanId;
                model.InvStatusId = invStatusId;

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
    }
}