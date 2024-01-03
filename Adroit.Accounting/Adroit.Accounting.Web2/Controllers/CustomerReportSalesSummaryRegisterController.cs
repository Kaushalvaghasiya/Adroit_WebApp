using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult SalesSummaryRegister()
        {
            SalesSummaryRegisterViewModel model = new SalesSummaryRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.InvTypeList = GenericHelper.GetInvoiceTypeList();
            model.ViewList = GenericHelper.GetSalesViewList();
            model.AccountBranchMappingList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);
            model.GSTTransactionTypeList = GenericHelper.GetGSTTransactionTypeList();
            model.PaymentStatusList = GenericHelper.GetPaymentStatusList();
            model.CustomerTypeList = GenericHelper.GetSalesCustomerTypeList();
            model.GSTList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);
            model.BookList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);

            return View(model);
        }
    }
}