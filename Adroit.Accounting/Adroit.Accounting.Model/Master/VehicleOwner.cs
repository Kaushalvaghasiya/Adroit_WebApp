//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class VehicleOwner
    {
        public VehicleOwner()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public string Pincode { get; set; } = string.Empty;
        public string Mobile { get; set; } = string.Empty;
        public string PAN { get; set; } = string.Empty;
        public int AccountId { get; set; }
        public int AddedById { get; set; }
        public DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string AdharUID { get; set; } = string.Empty;
        public bool Active { get; set; }
    }
}
