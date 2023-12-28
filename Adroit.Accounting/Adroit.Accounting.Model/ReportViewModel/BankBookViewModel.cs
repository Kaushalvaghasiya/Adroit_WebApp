using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class BankBookViewModel
    {
        public int[] BranchId { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public int[] BankBookId { get; set; }
        public List<DropdownViewModel> BankBookList { get; set; }
    }
}
