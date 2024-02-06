using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Globalization;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {        
        public IActionResult ProfitLoss()
        {
            return View();
        }
        public IActionResult TradingAccount()
        {
            return View();
        }
        public IActionResult BalanceSheet()
        {
            return View();
        }
        public IActionResult BalanceSheetSchedule()
        {
            return View();
        }
        public IActionResult TrialBalanceSummary()
        {
            return View();
        }
        public IActionResult TrialBalanceDetail()
        {
            return View();
        }
    }
}