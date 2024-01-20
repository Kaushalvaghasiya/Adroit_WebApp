using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRBookingDailySummaryViewModel : LRBookingViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string BranchIds { get; set; }
    }
}
