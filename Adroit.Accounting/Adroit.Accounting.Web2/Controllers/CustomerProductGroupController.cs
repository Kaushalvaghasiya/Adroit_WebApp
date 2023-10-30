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
    public partial class CustomerController : Controller
    {
        public IActionResult ProductGroup()
        {
            var model = new ProductGroupViewModel();
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductGroupTable._TableName, ProductGroupTable.Title);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductGroupTable._TableName, ProductGroupTable.OrderNumber);

            return View(model);
        }
        [HttpGet]
        public JsonResult ProductGroupList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<ProductGroupGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _productGroupRepository.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<ProductGroupGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult SaveProductGroup([FromBody] ProductGroup model)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                int userId = LoginHandler.GetUserId(User);

                model.AddedById = userId;
                model.ModifiedById = userId;

                int id = _productGroupRepository.Save(model, userId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteProductGroup(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);

                _productGroupRepository.Delete(id, userId, _configurationData.DefaultConnection);
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
        public JsonResult GetProductGroup(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                int userId = LoginHandler.GetUserId(User);
                result.data = _productGroupRepository.Get(id, userId, _configurationData.DefaultConnection);
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