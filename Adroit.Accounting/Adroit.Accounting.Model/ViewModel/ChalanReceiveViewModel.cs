//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.GridViewModel;

namespace Adroit.Accounting.Model.ViewModel
{
    public class ChalanReceiveViewModel : ChalanReceive
    {
        public List<DropdownViewModel> GoDownNumberList { get; set; }
        public List<DropdownViewModel> CustomerFirmBranchList { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public int LoginId { get; set; }
        public string? CheckedLRNumberIds { get; set; }
        public string? UnCheckedLRNumberIds { get; set; }
        public bool? Received { get; set; }
        public int? ChalanNumber { get; set; }
        public string? CityFrom { get; set; }
        public string? CityTo { get; set; }
        public string? VehilcleNumber { get; set; }
        public string? BillParty { get; set; }
        public string? DriverName { get; set; }
        public string? EwayBillNumber { get; set; }
        public decimal? TaxableAmount { get; set; }
        public decimal? TDSPercent { get; set; }
        public decimal? TDSAmount { get; set; }
        public decimal? AdvanceCash { get; set; }
        public decimal? AdvanceNeft { get; set; }
        public decimal? ReceiveCash { get; set; }
        public decimal? OtherPlus { get; set; }
        public decimal? OtherLess { get; set; }
        public string? BrokerName { get; set; }
        public decimal? BrokerAmount { get; set; }
        public decimal? NetAmount { get; set; }
        public string? Remarks { get; set; }
        public int? LRBookingId { get; set; }
        public int? LRNumber { get; set; }
        public System.DateTime LRDate { get; set; }
        public string PrivateMarka { get; set; }
        public short? Packing { get; set; }
        public decimal? ChargeWeight { get; set; }
        public string CityIdTo { get; set; }
        public string CityIdFrom { get; set; }
        public decimal? ChargeAmount { get; set; }
        public string Description { get; set; }
        public string Consignor { get; set; }
        public string Consignee { get; set; }
        public string BillPartyName { get; set; }
        public decimal? ToPayAmount { get; set; }
        public decimal? CrossingAmount { get; set; }
        public decimal? CrossingCommission { get; set; }
        public decimal? CrossingHamali { get; set; }
        public decimal? CrossingDeliveryCharge { get; set; }
        public string ToPayAccount { get; set; }
        public string CrossingAmountAccount { get; set; }
        public string CrossingCommissionAccount { get; set; }
        public string CrossingHamaliAccount { get; set; }
        public string CrossingDeliveryChargeAccount { get; set; }
        public string ToPayAccountLabel { get; set; }
        public string CrossingAmountAccountLabel { get; set; }
        public string CrossingCommissionAccountLabel { get; set; }
        public string CrossingHamaliAccountLabel { get; set; }
        public string CrossingDeliveryChargeAccountLabel { get; set; }
        public string SenderName { get; set; }
        public System.DateTime ChalanDate { get; set; }
        public decimal? Freight { get; set; }
        public decimal? ToPayLR { get; set; }
        public decimal? ToPayLRAmount { get; set; }
        public decimal? PaidLR { get; set; }
        public decimal? PaidLRAmount { get; set; }
        public decimal? TBBLR { get; set; }
        public decimal? TBBLRAmount { get; set; }
    }
}
