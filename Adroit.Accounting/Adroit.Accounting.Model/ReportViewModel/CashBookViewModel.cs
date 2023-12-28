using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class CashBookViewModel
    {
        public int[] BranchId { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public int[] CashBookId { get; set; }
        public List<DropdownViewModel> CashBookList { get; set; }
        public int[] PartyId { get; set; }
        public List<DropdownViewModel> PartyList { get; set; }
    }
}
