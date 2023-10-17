//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_JournalMaster_Z
    {
        public Z_JournalMaster_Z()
        {
        }
    
        public int Id { get; set; }
        public byte EntryTypeId { get; set; }
        public int FirmVoucherNumber { get; set; }
        public int BranchVoucherNumber { get; set; }
        public int YearId { get; set; }
        public int BranchId { get; set; }
        public System.DateTime Date { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
