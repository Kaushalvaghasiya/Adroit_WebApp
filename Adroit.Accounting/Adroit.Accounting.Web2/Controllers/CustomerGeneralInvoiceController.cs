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
        public IActionResult CustomerGeneralInvoice()
        {
            var model = new PurchaseBillMasterViewModel();
            model.BillTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);            
            model.BookBranchList = _customerBookRepository.SelectListByBookType(CurrentBranchId, "Purchase", _configurationData.DefaultConnection);
            model.InvoiceTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.TransporterList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.TransportName);
            model.TransGSTList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.GSTNumberTransport);
            model.VehicleNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, CustomerAccountTable._TableName, CustomerAccountTable.VehicleNumber);
            model.TransportModeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTTransportModeTable._TableName, GSTTransportModeTable.Title);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            var currentUserBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            ViewBag.LoggedInBranchCity = currentUserBranch.CityId;
            byte SoftwareId = _softwareRepository.GetSoftwareIdFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductAmtCalcOnList = _productAmtCalcOnRepository.SelectList(SoftwareId, _configurationData.DefaultConnection);
            return View(model);
        }
        [HttpGet]
        public JsonResult GetCustomerPurchase(int id)
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
        [Route("~/Customer/GetGridDataWithBookId/{bookId}")]
        public JsonResult GetGridDataWithBookId(int bookId)
        {
            ApiResult result = new ApiResult();
            try
            {
                CustomerBook CustomerBook = _customerBookRepository.GetWithCustomerBookBranchMapping(bookId, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                List<DropdownViewModel> ItemDescList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc1);
                var itemDesc2 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc2);
                var itemDesc3 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc3);
                var itemDesc4 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc4);
                var itemDesc5 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc5);
                var itemDesc6 = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillDetailTable._TableName, PurchaseBillDetailTable.ItemDesc6);

                ItemDescList.AddRange(itemDesc2);
                ItemDescList.AddRange(itemDesc3);
                ItemDescList.AddRange(itemDesc4);
                ItemDescList.AddRange(itemDesc5);
                ItemDescList.AddRange(itemDesc6);
                List<DropdownViewModel> SalesBillFromList = _salesBillFromAdminRepository.SalesBillFromIdsList(CustomerBook.SalesBillFrom, _configurationData.DefaultConnection);
                result.data = new
                {
                    CustomerBook = CustomerBook,
                    ItemDescList = ItemDescList,
                    SalesBillFromList = SalesBillFromList
                };
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
        public JsonResult CustomerPurchaseList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<PurchaseBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerGeneralInvoiceRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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
        [HttpPost]
        public JsonResult SaveCustomerPurchase([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.LoginId = CurrentUserId;
                model.BranchId = CurrentBranchId;
                model.FirmId = CurrentFirmId;
                int id = _customerGeneralInvoiceRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteCustomerPurchase(int id)
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
        public JsonResult GetPurchasebillDetailListByPurchaseBillMasterId(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _customerGeneralInvoiceRepository.GetPurchasebillDetailListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentBranchId);
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
        public IActionResult PurchaseReturn()
        {
            var model = new PurchaseBillMasterViewModel();
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
            model.BookBranchList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.InvoiceTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection); 
            return View(model);
        }
    }
}