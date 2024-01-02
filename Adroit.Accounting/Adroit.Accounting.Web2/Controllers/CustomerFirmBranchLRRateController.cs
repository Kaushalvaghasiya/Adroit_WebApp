using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerFirmBranchLRRate(int id)
        {
            CustomerFirmBranchLRRateViewModel model = new();
            model.CityList = _driverRepository.SelectLicenceIssuePlace(_configurationData.DefaultConnection);
            model.BranchList = _customerFirmBranchRepository.SelectListByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            model.LrRatePerKgList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.RatePerKg);
            model.LrRatePerParcelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.RatePerParcel);
            model.CrossingChargePerFreightList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CrossingChargePercentOnFreight);
            model.CrossingChargePerKgList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CrossingChargePerKg);
            model.CrossingChargePerParcelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CrossingChargePerParcel);
            model.CommissionPerFreightList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CommissionPercentOnFreight);
            model.CommissionPerKgList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CommissionPerKg);
            model.CommissionPerParcelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchLRRateTable._TableName, CustomerFirmBranchLRRateTable.CommissionPerParcel);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchLRRateList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerFirmBranchLRRateGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerFirmBranchLRRateRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmBranchLRRateGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirmBranchLRRate([FromBody] CustomerFirmBranchLRRate model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.AddedById = CurrentUserId;
                model.ModifiedById = CurrentUserId;
                int id = _customerFirmBranchLRRateRepository.Save(model, _configurationData.DefaultConnection);
                if (id > 0)
                {
                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetCustomerFirmBranchLRRate(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmBranchLRRateRepository.Get(id, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}