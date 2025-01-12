//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_AccountOutStanding_Z
    {
        public Z_AccountOutStanding_Z()
        {
        }
        public int Id { get; set; }
        public int JournalDetailId { get; set; }
        public int BillId { get; set; }
        public string Type { get; set; }
        public decimal? PaidAmount { get; set; }
        public bool BillEnd { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
