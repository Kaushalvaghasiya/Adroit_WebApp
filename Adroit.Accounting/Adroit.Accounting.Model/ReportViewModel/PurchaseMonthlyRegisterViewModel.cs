using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class PurchaseMonthlyRegisterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> GSTList { get; set; }
        public List<DropdownViewModel> PurchaseInoiceType { get; set; }
        public List<DropdownViewModel> PurchaseType { get; set; }
        public int[] BranchId { get; set; }
        public int ViewId { get; set; }
        public int GSTId { get; set; }
        public int PurchaseInoiceTypeId { get; set; }
        public int PurchaseTypeId { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }

    }
}
