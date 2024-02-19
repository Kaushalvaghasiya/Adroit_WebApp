//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirmBranchTransportSetting
    {
        public CustomerFirmBranchTransportSetting()
        {

        }
        public int BranchId { get; set; }
        public int GatePassBookBranchMappingId { get; set; }
        public int PurcahseBookBranchMappingId { get; set; }
        public int BookingSalesBookBranchMappingId { get; set; }
        public int DeliverySalesBookBranchMappingId { get; set; }
        public int ToPayAccountBranchMappingId { get; set; }
        public int? CrossingAmountAccountBranchMappingId { get; set; }
        public int? CrossingCommissionAccountBranchMappingId { get; set; }
        public int? CrossingHamaliAccountBranchMappingId { get; set; }
        public int? CrossingDeliveryChargeAccountBranchMappingId { get; set; }
        public int? SalesAccountBranchMappingId { get; set; }
        public bool IsAutoJvEnableForChallan { get; set; }
        public bool IsFreightAddInToBillForDelivery { get; set; }
        public byte LRRateOnId { get; set; }
        public byte LRPayTypeId { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
