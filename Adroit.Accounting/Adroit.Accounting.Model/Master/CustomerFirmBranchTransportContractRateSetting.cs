//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirmBranchTransportContractRateSetting
    {
        public CustomerFirmBranchTransportContractRateSetting()
        {

        }
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int CityId { get; set; }
        public decimal? RatePerKG { get; set; }
        public decimal? RatePerParcel { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
