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
        public IActionResult Purchase()
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