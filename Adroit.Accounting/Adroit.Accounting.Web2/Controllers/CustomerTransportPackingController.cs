using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult TransportPacking()
        {
            TransportPackingViewModel model = new();
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, TransportPackingTable._TableName, TransportPackingTable.Title);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, TransportPackingTable._TableName, TransportPackingTable.OrderNumber);
            //model.CustomerList = _customerRepository.SelectList(_configurationData.DefaultConnection);
            return View(model);
        }

        [HttpGet]
        public JsonResult TransportPackingList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<TransportPackingGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _transportpackingRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<TransportPackingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveTransportPacking([FromBody] TransportPacking model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.ModifiedById = CurrentUserId;
                model.AddedById = CurrentUserId;
                int id = _transportpackingRepository.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteTransportPacking(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _transportpackingRepository.Delete(id, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult GetTransportPacking(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _transportpackingRepository.Get(id, CurrentUserId, _configurationData.DefaultConnection);
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