using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRBookingMonthlySummaryViewModel : LRBookingViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public string BranchIds { get; set; }
        public List<DropdownViewModel> LRStatusList { get; set; }
        public int LRStatusId { get; set; }

    }
}