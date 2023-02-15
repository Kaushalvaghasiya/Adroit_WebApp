//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class TransportPacking
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Title { get; set; } = string.Empty;
        public byte? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public bool IsActive { get; set; }
    }
}
