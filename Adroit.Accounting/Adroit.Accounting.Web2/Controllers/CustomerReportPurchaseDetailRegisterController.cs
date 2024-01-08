using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult PurchaseDetailRegister()
        {
            PurchaseDetailRegisterViewModel model = new PurchaseDetailRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.InvTypeList = GenericHelper.GetInvoiceTypeList();
            model.ViewList = GenericHelper.GetSalesViewList();
            model.PurchaseBy = GenericHelper.GetPurchaseBy();
            model.PurchaseInvoiceType = GenericHelper.GetPurchaseInvoiceType();
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.ProductGroupList = _productGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductSubGroupList = _productSubGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.DescriptionList = _transportDescRepository.SelectList(_configurationData.DefaultConnection, CurrentFirmId);
            model.GSTTransactionTypeList = GenericHelper.GetGSTTransactionTypeList();
            model.PaymentStatusList = GenericHelper.GetPaymentStatusList();
            model.CustomerTypeList = GenericHelper.GetSalesCustomerTypeList();
            model.GSTList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);
            model.BookList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);

            return View(model);
        }
    }
}