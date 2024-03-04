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
using NuGet.Packaging;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerGeneralExpensesMulti()
        {
            var model = new PurchaseBillMasterViewModel();

            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.CustomerBook = _customerBookRepository.GetListWithIsGeneralPurchaseId(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId);
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.ItemDescList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc1);
            var itemDesc2 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc2);
            var itemDesc3 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc3);
            var itemDesc4 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc4);
            var itemDesc5 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc5);
            var itemDesc6 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc6);
            model.ItemDescList.AddRange(itemDesc2);
            model.ItemDescList.AddRange(itemDesc3);
            model.ItemDescList.AddRange(itemDesc4);
            model.ItemDescList.AddRange(itemDesc5);
            model.ItemDescList.AddRange(itemDesc6);
            byte SoftwareId = _softwareRepository.GetSoftwareIdFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductAmtCalcOnList = _productAmtCalcOnRepository.SelectList(SoftwareId, _configurationData.DefaultConnection);
            return View(model);
        }

        [HttpPost]
        public JsonResult SaveCustomerGeneralExpensesMulti([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.LoginId = CurrentUserId;
                model.BranchId = CurrentBranchId;
                model.FirmId = CurrentFirmId;
                int id = _customerGeneralExpensesMultiRepository.Save(model, _configurationData.DefaultConnection);
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
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
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
                result.data = _chalanRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
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
        public JsonResult SearchCustomerGeneralExpensesMultiProductDesc(string search)
        {
            ApiResult result = new ApiResult();
            try
            {
                if (search == null || search == "")
                {
                    result.data = new List<ProductViewModel>();
                    result.result = Constant.API_RESULT_SUCCESS;
                }
                else {
                    result.data = _customerGeneralExpensesMultiRepository.CustomerGeneralExpenseMultiSearchProductDescList(_configurationData.DefaultConnection, search, CurrentBranchId, CurrentFirmId);
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

        [Route("~/Customer/GetProductDetailsByMappingId/{ProductBranchMappingId}")]
        public JsonResult GetProductDetailsByMappingId(int ProductBranchMappingId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _productRepository.GetByProductBranchMappingId(ProductBranchMappingId, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId);
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