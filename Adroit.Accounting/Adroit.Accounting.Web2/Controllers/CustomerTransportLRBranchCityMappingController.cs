using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
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
        public IActionResult TransportLRBranchCityMapping()
        {
            var model = new TransportLRBranchCityMappingViewModel();
            int loginId = LoginHandler.GetUserId(User);

            model.BranchList = _customerFirmBranchRepository.SelectList(loginId, true, _configurationData.DefaultConnection);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, TransportLRBranchCityMappingTable._TableName, TransportLRBranchCityMappingTable.OrderNumber);

            return View(model);
        }

        [HttpGet]
        public JsonResult TransportLRBranchCityMappingList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<TransportLRBranchCityMappingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _transportLRBranchCityMappingRepository.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<TransportLRBranchCityMappingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveTransportLRBranchCityMapping([FromBody] TransportLRBranchCityMapping model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);

                int id = _transportLRBranchCityMappingRepository.Save(model, loginId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteTransportLRBranchCityMapping(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);

                _transportLRBranchCityMappingRepository.Delete(id, loginId, _configurationData.DefaultConnection);
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
        public JsonResult GetTransportLRBranchCityMapping(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _transportLRBranchCityMappingRepository.Get(id, _configurationData.DefaultConnection);
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