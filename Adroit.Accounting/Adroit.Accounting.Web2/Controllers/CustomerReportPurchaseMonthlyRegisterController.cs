using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult PurchaseMonthlyRegister()
        {
            PurchaseMonthlyRegisterViewModel model = new PurchaseMonthlyRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetSalesViewList();
            model.PurchaseInoiceType = GenericHelper.GetPurchaseInvoiceType();
            model.PurchaseType = GenericHelper.GetPurchaseType();
            model.GSTList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);
            return View(model);
        }
    }
}