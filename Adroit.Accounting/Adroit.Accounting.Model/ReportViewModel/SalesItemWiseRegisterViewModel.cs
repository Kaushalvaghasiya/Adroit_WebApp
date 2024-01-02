using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class SalesItemWiseRegisterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> InvTypeList { get; set; }
        public List<DropdownViewModel> ProductGroupList { get; set; }
        public List<DropdownViewModel> ProductSubGroupList { get; set; }
        public List<DropdownViewModel> DesignList { get; set; }
        public List<DropdownViewModel> ColourList { get; set; }
        public List<DropdownViewModel> DescriptionList { get; set; }
        public List<DropdownViewModel> GSTList { get; set; }
        public List<DropdownViewModel> ProductSizeList { get; set; }
        public int[] BranchId { get; set; }
        public int InvTypeId { get; set; }
        public int[] ProductGroupId { get; set; }
        public int[] ProductSubGroupId { get; set; }
        public int[] DesignId { get; set; }
        public int[] ColourId { get; set; }
        public int[] DescriptionId { get; set; }
        public int GSTId { get; set; }
        public int[] ProductSizeId { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }

    }
}
