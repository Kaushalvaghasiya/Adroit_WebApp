using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerGeneralExpensesMulti()
        {
            var model = new PurchaseBillMasterViewModel();

            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.ProductGroupList = _productGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductColorList = _productColorRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection); 
            model.ProductSizeList = _productSizeRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductDesignNumberList = _productDesignNumberRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.CustomerBook = _customerBookRepository.GetListWithIsGeneralPurchaseId(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId);
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);

            return View(model);
        }
        [HttpPost]
        public JsonResult SaveCustomerGeneralExpensesMulti([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerGeneralExpensesMultiRepository.Save(model, _configurationData.DefaultConnection, CurrentFirmId, CurrentBranchId, CurrentUserId);
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
        public JsonResult GetCustomerGeneralExpensesMulti(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _customerGeneralExpensesMultiRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                //data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId);
                result.data = data;
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
        public JsonResult CustomerGeneralExpensesMultiList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<PurchaseBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerGeneralExpensesMultiRepository.List(_configurationData.DefaultConnection, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<PurchaseBillMasterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteCustomerGeneralExpensesMulti(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerGeneralExpensesMultiRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        //[Route("~/Customer/GetListByCityFrom_To/{fromCityId}/{toCityId}")]
        //public JsonResult GetListByCityFrom_To(int fromCityId, int toCityId, int draw = 0, int start = 0, int length = 10)
        //{
        //    var result = new DataTableListViewModel<LRBookingGridViewModel>();
        //    try
        //    {
        //        //// note: we only sort one column at a time
        //        var search = Request.Query["search[value]"];
        //        var sortColumn = int.Parse(Request.Query["order[0][column]"]);
        //        var sortDirection = Request.Query["order[0][dir]"];

        //        var records = _lrBookingRepository.GetListByCityFrom_To(_configurationData.DefaultConnection, fromCityId, toCityId, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
        //        result.data = records;
        //        result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
        //        result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = new List<LRBookingGridViewModel>();
        //        result.recordsTotal = 0;
        //        result.recordsFiltered = 0;
        //    }
        //    return Json(result);
        //}

        //[Route("~/Customer/GetListByPurchaseBillMasterId/{purchaseBillMasterId}")]
        //public JsonResult GetListByPurchaseBillMasterId(int purchaseBillMasterId)
        //{
        //    ApiResult result = new ApiResult();
        //    try
        //    {
        //        result.data = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, purchaseBillMasterId, CurrentUserId, CurrentBranchId, CurrentFirmId);
        //        result.result = Constant.API_RESULT_SUCCESS;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = ErrorHandler.GetError(ex);
        //        result.result = Constant.API_RESULT_ERROR;
        //    }
        //    return Json(result);
        //}

        [Route("~/Customer/GetListWithCustomerAccountBranchMappingId/{CustomerAccountBranchMappingId}")]
        public JsonResult GetCustomerAccountListWithCreditDays(int CustomerAccountBranchMappingId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.GetListWithCustomerAccountBranchMappingId(_configurationData.DefaultConnection, CustomerAccountBranchMappingId, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetProductListWithGroupId/{GroupId}")]
        public JsonResult GetProductListWithGroupId(int GroupId)
        {
            ApiResult result = new ApiResult();
            try
            {
                var model = new PurchaseBillMasterViewModel();
                model.ProductDescriptionList = _productRepository.GetListWithGroupId(_configurationData.DefaultConnection, GroupId, CurrentUserId, CurrentFirmId);
                result.data = model.ProductDescriptionList;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetRateListWithProductId/{productId}")]
        public JsonResult GetRateListWithProductId(int productId)
        {
            ApiResult result = new ApiResult();
            try
            {
                var model = new PurchaseBillMasterViewModel();
                result.data = _gstRateRepository.GetListWithProductId(_configurationData.DefaultConnection, productId);
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