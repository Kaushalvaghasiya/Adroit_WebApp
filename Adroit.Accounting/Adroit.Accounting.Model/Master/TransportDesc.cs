//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class TransportDesc
    {
        public TransportDesc()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Title { get; set; }
        public byte? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public bool IsActive { get; set; }
    }
}
