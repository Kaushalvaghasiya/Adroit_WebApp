using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRBookingChalanMonthlyReport()
        {
            LRBookingChalanMonthlyReportViewModel model = new LRBookingChalanMonthlyReportViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            return View(model);
        }
    }
}