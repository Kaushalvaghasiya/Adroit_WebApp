//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirmBranchLRRate
    {
        public CustomerFirmBranchLRRate()
        {

        }
        public int Id { get; set; }
        public int BranchId { get; set; }
        public int CityId { get; set; }
        public decimal? RatePerKg { get; set; }
        public decimal? RatePerParcel { get; set; }
        public bool IsCrossingChargeApply { get; set; }
        public decimal? CrossingChargePercentOnFreight { get; set; }
        public decimal? CrossingChargePerKg { get; set; }
        public decimal? CrossingChargePerParcel { get; set; }
        public bool IsCommissionApply { get; set; }
        public decimal? CommissionPercentOnFreight { get; set; }
        public decimal? CommissionPerKg { get; set; }
        public decimal? CommissionPerParcel { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
