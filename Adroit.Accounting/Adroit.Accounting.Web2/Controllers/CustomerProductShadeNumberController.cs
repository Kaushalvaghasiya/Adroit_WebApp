using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;
using Adroit.Accounting.Repository;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult ProductShadeNumber()
        {
            var model = new ProductShadeNumberViewModel();
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductShadeNumberTable._TableName, ProductShadeNumberTable.Title);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductShadeNumberTable._TableName, ProductShadeNumberTable.OrderNumber);

            return View(model);
        }
        [HttpGet]
        public JsonResult ProductShadeNumberList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<ProductShadeNumberGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _productShadeNumberRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<ProductShadeNumberGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult SaveProductShadeNumber([FromBody] ProductShadeNumber model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.AddedById = CurrentUserId;
                model.ModifiedById = CurrentUserId;

                int id = _productShadeNumberRepository.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteProductShadeNumber(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _productShadeNumberRepository.Delete(id, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult GetProductShadeNumber(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _productShadeNumberRepository.Get(id, CurrentUserId, _configurationData.DefaultConnection);
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