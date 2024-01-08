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
    public partial class CustomerController : MasterController
    {
        public IActionResult Broker(int id = 0)
        {
            BrokerViewModel model = new BrokerViewModel() { Id = id };
            model.CityList = _driverRepository.SelectLicenceIssuePlace(_configurationData.DefaultConnection);
            model.BrokerNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, BrokerTable._TableName, BrokerTable.Name);
            model.BrokerageList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, BrokerTable._TableName, BrokerTable.Brokerage);
            model.BranchList = _customerFirmBranchRepository.SelectListByCustomerId(CurrentFirmId, _configurationData.DefaultConnection);
            return View(model);
        }

        [HttpGet]
        public JsonResult BrokerList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<BrokerGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _brokerRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<BrokerGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveBroker([FromBody] BrokerViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.OwnerBranchId = CurrentBranchId;
                model.ModifiedById = CurrentUserId;
                model.AddedById = CurrentUserId;
                int id = _brokerRepository.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteBroker(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _brokerRepository.Delete(id, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult GetBroker(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _brokerRepository.Get(id, CurrentUserId, _configurationData.DefaultConnection);
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