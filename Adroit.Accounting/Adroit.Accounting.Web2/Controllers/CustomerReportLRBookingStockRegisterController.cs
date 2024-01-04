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

        [HttpGet]
        [Route("~/CustomerReport/LRBookingStockRegisterReportList/{branchIds}/{DateFrom}/{DateTo}/{CityToIds}/{CityFromIds}/{ConsignorIds}/{ConsigneeIds}/{BillPartyIds}/{PayTypeIds}/{ChalanId}/{InvStatus}/{Summary}")]
        public JsonResult LRBookingStockRegisterReportList(int draw = 0, int start = 0, int length = 10, string branchIds = "", string DateFrom = "", string DateTo = "", string CityToIds = "", string CityFromIds = "", string ConsignorIds = "", string ConsigneeIds = "", string BillPartyIds = "", string PayTypeIds = "", string ChalanId = "", string InvStatus = "", bool Summary = false)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _reportLRBookingStockRegisterRepository.SelectList(_configurationData.DefaultConnection, CurrentUserId, branchIds, CurrentFirmId, search, start, length, sortColumn, sortDirection, DateFrom, DateTo, CityToIds, CityFromIds, ConsignorIds, ConsigneeIds, BillPartyIds, PayTypeIds, ChalanId, InvStatus, Summary).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
    }
}