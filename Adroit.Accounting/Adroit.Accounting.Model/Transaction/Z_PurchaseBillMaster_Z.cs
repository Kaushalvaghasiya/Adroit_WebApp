//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_PurchaseBillMaster_Z
    {
        public Z_PurchaseBillMaster_Z()
        {
        }
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int BookBranchMappingId { get; set; }
        public string BillNumberFirm { get; set; }
        public string BillNumberTable { get; set; }
        public int BillNumberBranch { get; set; }
        public string BillNumberBranchTable { get; set; }
        public byte EntryTypeId { get; set; }
        public System.DateTime BillDate { get; set; }
        public int VehicleId { get; set; }
        public int? CityIdFrom { get; set; }
        public int? CityIdTo { get; set; }
        public int? DriverId { get; set; }
        public int DeliveryBranchId { get; set; }
        public string EwayBillNumber { get; set; }
        public System.DateTime? ValidDateFrom { get; set; }
        public System.DateTime? ValidDateTo { get; set; }
        public decimal? TaxableAmount { get; set; }
        public decimal? TDSPercent { get; set; }
        public decimal? TDSAmount { get; set; }
        public decimal? AdvanceCash { get; set; }
        public decimal? AdvanceNeft { get; set; }
        public decimal? OtherLess { get; set; }
        public decimal? ReceiveCash { get; set; }
        public decimal? OtherPlus { get; set; }
        public decimal? SGSTTotal { get; set; }
        public decimal? CGSTTotal { get; set; }
        public decimal? IGSTTotal { get; set; }
        public decimal? GSTStateCessTotal { get; set; }
        public decimal? GSTCentralCessTotal { get; set; }
        public decimal? TCSPercent { get; set; }
        public decimal? TCSAmount { get; set; }
        public decimal? ToPayAmount { get; set; }
        public decimal? CrossingAmount { get; set; }
        public decimal? CrossingCommission { get; set; }
        public decimal? CrossingHamali { get; set; }
        public decimal? CrossingDeliveryCharge { get; set; }
        public decimal? CreditDays { get; set; }
        public decimal? RoundOff { get; set; }
        public decimal? BillAmount { get; set; }
        public int? BrokerBranchMappingId { get; set; }
        public decimal? BrokerAmount { get; set; }
        public string Notes { get; set; }
        public int? ToPayAccountBranchMappingId { get; set; }
        public int? CrossingAmountAccountBranchMappingId { get; set; }
        public int? CrossingCommissionAccountBranchMappingId { get; set; }
        public int? CrossingHamaliAccountBranchMappingId { get; set; }
        public int? CrossingDeliveryAccountBranchMappingId { get; set; }
        public int? SalesAccountBranchMappingId { get; set; }
        public int? GenaralPurchaseAccountBranchMappingId { get; set; }
        public bool SkipInGSTR { get; set; }
        public int? RCMId { get; set; }
        public int? RCMBillNumber { get; set; }
        public byte? BillTypeID { get; set; }
        public string ReturnBillNumber { get; set; }
        public System.DateTime? ReturnBillDate { get; set; }
        public byte? ReturnReasonId { get; set; }
        public string PurchaseOrderRefNo { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
