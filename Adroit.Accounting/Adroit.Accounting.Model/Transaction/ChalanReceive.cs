//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class ChalanReceive
    {
        public ChalanReceive()
        {
        }
        public int Id { get; set; }
        public int PurchaseBillMasterId { get; set; }
        public System.DateTime ReceiveDate { get; set; }
        public int BillNumberBranch { get; set; }
        public int BillNumberFirm { get; set; }
        public int BranchId { get; set; }
        public int FirmId { get; set; }
        public int YearId { get; set; }
        public int UserId { get; set; }
        public int GoDownNumber { get; set; }
        public string ReceivedNote { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
