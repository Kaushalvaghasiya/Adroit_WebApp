//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_JournalDetail_Z
    {
        public Z_JournalDetail_Z()
        {
        }
    
        public int Id { get; set; }
        public int JournalId { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int AccountBranchMappingIdOther { get; set; }
        public string Type { get; set; }
        public decimal Amount { get; set; }
        public string ReceiptNumber { get; set; }
        public short SubSRNumber { get; set; }
        public bool IsBillSelected { get; set; }
        public string Description1 { get; set; }
        public string Description2 { get; set; }
        public bool IsAudit { get; set; }
        public System.DateTime? ReconcileDate { get; set; }
        public string BillNumberDetail { get; set; }
        public int? ParentJournalDetailId { get; set; }
    }
}
