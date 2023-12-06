using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult CustomerAccount()
        {
            CustomerAccountViewModel model = new();
            int loginId = LoginHandler.GetUserId(User);
            var Customer = _customerRepository.Get(loginId, _configurationData.DefaultConnection);

            model.AccountGroupList = _customerAccountGroupRepo.sp_CustomerAccountGroupByFirmIdList_Select(CurrentFirmId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.CountryList = _countryRepository.SelectList(_configurationData.DefaultConnection);

            model.AreaNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.AreaName);
            model.TransportNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.TransportName);
            model.NameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.Name);
            model.BrokerBranchMappingList = _customerBrokerBranchMappingRepo.GetCustomerBrokerBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.BranchList = _customerFirmBranchRepository.SelectList(Customer.Id, true, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult AccountList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<CustomerAccountGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerAccountRepo.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerAccountGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveAccount([FromBody] CustomerAccountViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.loginId = LoginHandler.GetUserId(User);
                model.OwnerBranchId = CurrentBranchId;
                model.firmId = CurrentFirmId;
                int id = _customerAccountRepo.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var loginId = LoginHandler.GetUserId(User);
                _customerAccountRepo.Delete(id, _configurationData.DefaultConnection, loginId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetAccount(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.Get(id, _configurationData.DefaultConnection,0, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetTransporterGSTNumberByTransporterName/{name}")]
        public JsonResult GetTransporterGSTNumberByTransporterName(string name)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.GetTransporterGSTNumberList(name, CurrentFirmId,_configurationData.DefaultConnection);
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