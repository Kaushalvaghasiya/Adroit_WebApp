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
        public IActionResult CreditNoteSales()
        {
            var model = new SalesBillMasterViewModel();            
            model.BookBranchList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.InvoiceTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.BrokerBranchMappingList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            return View(model);
        }
        public IActionResult CreditNotePurchaseInterest()
        {
            var model = new SalesBillMasterViewModel();
            model.BookBranchList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.InvoiceTypeList = _billTypeAdminRepository.GetBillTypeAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.BillFromList = _salesBillFromAdminRepository.SalesBillFromAdminList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.BrokerBranchMappingList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            return View(model);
        }
    }
}