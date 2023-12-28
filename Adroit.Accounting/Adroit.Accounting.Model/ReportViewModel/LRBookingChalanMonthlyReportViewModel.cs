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
    }
}
