using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult SalesMonthlyRegister()
        {
            SalesMonthlyRegisterViewModel model = new SalesMonthlyRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.InvTypeList = GenericHelper.GetInvoiceTypeList();
            model.ViewList = GenericHelper.GetSalesViewList();
            model.GSTList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);
            return View(model);
        }
    }
}