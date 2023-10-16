//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_CreditDebitNoteDetail_Z
    {
        public int Id { get; set; }
        public int CreditDebitNoteMasterId { get; set; }
        public int ProductBranchMappingId { get; set; }
        public int? PurchaseBillNumberId { get; set; }
        public int? SalesBillNumberId { get; set; }
        public decimal Rate { get; set; }
        public decimal BasicAmount { get; set; }
        public string BillNotes { get; set; }
        public int? BillOutstandingId { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
