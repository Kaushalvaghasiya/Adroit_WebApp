//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_CreditDebitNoteMaster_Z
    {
        public Z_CreditDebitNoteMaster_Z()
        {
        }
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int AccountBranchMappingIdOther { get; set; }
        public int BookBranchMappingId { get; set; }
        public int BillNumber { get; set; }
        public byte EntryTypeId { get; set; }
        public System.DateTime BillDate { get; set; }
        public int BillNumberBranch { get; set; }
        public string BillType { get; set; }
        public string PartyReferenceNo { get; set; }
        public bool SkipInGSTR { get; set; }
        public byte ReturnReasonId { get; set; }
        public int ProductBranchMappingId { get; set; }
        public int? TDSAccountBranchMappingId { get; set; }
        public decimal TDSPercentage { get; set; }
        public decimal TDSAmount { get; set; }
        public decimal TCSPercentage { get; set; }
        public decimal TCSAmount { get; set; }
        public decimal SGSTPercentage { get; set; }
        public decimal SGSTAmount { get; set; }
        public decimal CGSTPercentage { get; set; }
        public decimal CGSTAmount { get; set; }
        public decimal IGSTPercentage { get; set; }
        public decimal IGSTAmount { get; set; }
        public decimal GSTStateCessPercentage { get; set; }
        public decimal GSTStateCessAmount { get; set; }
        public decimal GSTCentralCessPercentage { get; set; }
        public decimal GSTCentralCessAmount { get; set; }
        public decimal RoundOff { get; set; }
        public decimal BillAmount { get; set; }
        public string Notes { get; set; }
        public string IRNNumber { get; set; }
        public string AcknowledgementNumber { get; set; }
        public System.DateTime? IRNDate { get; set; }
        public int? PurchaseBillMasterId { get; set; }
        public int? SalesBillMasterId { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
