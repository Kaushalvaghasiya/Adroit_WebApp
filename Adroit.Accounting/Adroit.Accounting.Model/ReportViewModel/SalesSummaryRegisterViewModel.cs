using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class SalesSummaryRegisterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> InvTypeList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> BillPartyList { get; set; }
        public List<DropdownViewModel> BrokerList { get; set; }
        public List<DropdownViewModel> GSTTransactionTypeList { get; set; }
        public List<DropdownViewModel> PaymentStatusList { get; set; }
        public List<DropdownViewModel> CustomerTypeList { get; set; }
        public List<DropdownViewModel> GSTList { get; set; }
        public List<DropdownViewModel> BookList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public int[] BranchId { get; set; }
        public int ViewId { get; set; }
        public int[] BillPartyId { get; set; }
        public int[] BrokerId { get; set; }
        public int InvTypeId { get; set; }
        public int GSTTransactionTypeId { get; set; }
        public int PaymentStatusId { get; set; }
        public int CustomerTypeId { get; set; }
        public int GSTId { get; set; }
        public int[] BookId { get; set; }
        public int[] AccountBranchMappingId { get; set; }
        public int[] DeliveryPartyId { get; set; }
        public int[] HastePartyId { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
