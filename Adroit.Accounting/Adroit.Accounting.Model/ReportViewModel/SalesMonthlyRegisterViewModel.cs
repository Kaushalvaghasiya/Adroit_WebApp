using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class SalesMonthlyRegisterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> InvTypeList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> GSTList { get; set; }
        public int[] BranchId { get; set; }
        public int ViewId { get; set; }
        public int InvTypeId { get; set; }
        public int GSTId { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
    }
}
