//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Broker
    {
        public Broker()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int? CityId { get; set; }
        public string Pincode { get; set; }
        public string ContactPersonName { get; set; }
        public string Mobile { get; set; }
        public string MobileAlternate { get; set; }
        public string Email { get; set; }
        public decimal Brokerage { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int OwnerBranchId { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public string AdharUID { get; set; }
        public bool IsActive { get; set; }
    }
}
