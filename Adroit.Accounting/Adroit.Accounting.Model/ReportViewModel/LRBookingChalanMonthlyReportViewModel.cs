using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRBookingChalanMonthlyReportViewModel : PurchaseBillMasterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public string BranchIds { get; set; }
        public string? BillMonth { get; set; }
        public decimal? Freight { get; set; }
        public decimal? InvoiceValue { get; set; }
    }
}
