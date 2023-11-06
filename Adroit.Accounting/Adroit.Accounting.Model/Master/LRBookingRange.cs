//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class LRBookingRange
    {
        public LRBookingRange()
        {

        }
        public int Id { get; set; }
        public int BranchId { get; set; }
        public int StartNumber { get; set; }
        public int EndNumber { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
