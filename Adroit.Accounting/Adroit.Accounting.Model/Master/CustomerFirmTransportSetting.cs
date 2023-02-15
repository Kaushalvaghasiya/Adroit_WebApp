//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirmTransportSetting
    {
        public CustomerFirmTransportSetting()
        {

        }
        public int FirmId { get; set; }
        public bool IsWeightRoundOff { get; set; }
        public bool IsPartyAndCityRateFromLastLR { get; set; }
        public string LRBookChargeLable1 { get; set; }
        public string LRBookChargeLable2 { get; set; }
        public string LRBookChargeLable3 { get; set; }
        public string LRBookChargeLable4 { get; set; }
        public string LRBookChargeLable5 { get; set; }
        public string LRBookChargeLable6 { get; set; }
        public string DeliveryChargeLable1 { get; set; }
        public string DeliveryChargeLable2 { get; set; }
        public string DeliveryChargeLable3 { get; set; }
        public string DeliveryChargeLable4 { get; set; }
        public string DeliveryChargeLable5 { get; set; }
        public string DeliveryChargeLable6 { get; set; }
        public decimal ReverseChargeLimitForSalesGST { get; set; }
        public bool ReverseChargeApplyForURDParty { get; set; }
        public int ProductIdForSales { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
