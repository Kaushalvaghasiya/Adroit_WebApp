//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Driver
    {
        public Driver()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public string Pincode { get; set; }
        public int? LicenceIssuePlaceId { get; set; }
        public string LicenceNumber { get; set; }
        public string AdharUID { get; set; }
        public string Mobile { get; set; }
        public System.DateTime? LicenceExpiry { get; set; }
        public byte DriverTypeId { get; set; }
        public bool Deleted { get; set; }
        public bool Active { get; set; } = true;
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
