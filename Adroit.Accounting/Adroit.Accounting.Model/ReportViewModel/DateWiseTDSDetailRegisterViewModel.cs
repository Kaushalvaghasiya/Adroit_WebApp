using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class DateWiseTDSDetailRegisterViewModel
    {
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> BankBookList { get; set; }
        public List<DropdownViewModel> TransactionTypeViewList { get; set; }
        public List<DropdownViewModel> BillPartyList { get; set; }
        public int[] BranchId { get; set; }
        public int[] BankBookId { get; set; }
        public int[] BillPartyId { get; set; }
        public int ViewId { get; set; }
        public int TransactionTypeId { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
