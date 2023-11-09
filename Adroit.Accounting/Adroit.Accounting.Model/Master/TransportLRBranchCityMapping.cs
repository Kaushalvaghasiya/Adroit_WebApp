//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class TransportLRBranchCityMapping
    {
        public int Id { get; set; }
        public int BranchId { get; set; }
        public int CityId { get; set; }
        public int OrderNumber { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public bool Active { get; set; }
        public string CityName { get; set; }
        public string BranchName { get; set; }
    }
}
