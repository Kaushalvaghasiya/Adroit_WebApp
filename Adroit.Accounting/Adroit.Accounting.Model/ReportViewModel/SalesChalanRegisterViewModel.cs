using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class SalesChalanRegisterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ChalanType { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> BillPartyList { get; set; }
        public List<DropdownViewModel> BrokerList { get; set; }
        public List<DropdownViewModel> ProductGroupList { get; set; }
        public List<DropdownViewModel> ProductSubGroupList { get; set; }
        public List<DropdownViewModel> DescriptionList { get; set; }
        public List<DropdownViewModel> GSTTransactionTypeList { get; set; }
        public List<DropdownViewModel> PaymentStatusList { get; set; }
        public List<DropdownViewModel> CustomerTypeList { get; set; }
        public List<DropdownViewModel> GSTList { get; set; }
        public List<DropdownViewModel> BookList { get; set; }
        public int[] BranchId { get; set; }
        public int ViewId { get; set; }
        public int[] BillPartyId { get; set; }
        public int BrokerId { get; set; }
        public int ChalanTypeId { get; set; }
        public int ProductGroupId { get; set; }
        public int ProductSubGroupId { get; set; }
        public int DescriptionId { get; set; }
        public int GSTTransactionTypeId { get; set; }
        public int PaymentStatusId { get; set; }
        public int CustomerTypeId { get; set; }
        public int GSTId { get; set; }
        public int BookId { get; set; }

        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
    }
}
