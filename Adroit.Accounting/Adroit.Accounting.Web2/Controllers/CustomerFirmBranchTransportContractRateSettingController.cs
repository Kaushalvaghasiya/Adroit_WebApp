using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult CustomerFirmBranchTransportContractRateSetting(int id = 0)
        {
            CustomerFirmBranchTransportContractRateSettingViewModel model = new CustomerFirmBranchTransportContractRateSettingViewModel() { Id = id };
            int userId = LoginHandler.GetUserId(User);
            int branchId = LoginHandler.GetBranchId(User, _userRepository, _configurationData.DefaultConnection);

            model.CustomerList = _customerAccountRepo.GetCustomerAccountListByBranchMapping(userId, branchId, _configurationData.DefaultConnection);
            model.CityList = _driverRepository.SelectLicenceIssuePlace(_configurationData.DefaultConnection);
            model.RatePerKGList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchTransportContractRateSettingTable._TableName, CustomerFirmBranchTransportContractRateSettingTable.RatePerKG);
            model.RatePerParcelList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerFirmBranchTransportContractRateSettingTable._TableName, CustomerFirmBranchTransportContractRateSettingTable.RatePerParcel);

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmBranchTransportContractRateSettingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<CustomerFirmBranchTransportContractRateSettingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerFirmBranchTransportContractRateSettingRepository.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmBranchTransportContractRateSettingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveCustomerFirmBranchTransportContractRateSetting([FromBody] CustomerFirmBranchTransportContractRateSettingViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                model.ModifiedById = LoginHandler.GetUserId(User);
                model.AddedById = LoginHandler.GetUserId(User);
                int id = _customerFirmBranchTransportContractRateSettingRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirmBranchTransportContractRateSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmBranchTransportContractRateSettingRepository.Get(id, _configurationData.DefaultConnection);
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