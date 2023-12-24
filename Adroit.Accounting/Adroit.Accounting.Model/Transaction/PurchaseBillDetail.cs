//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class PurchaseBillDetail
    {
        public PurchaseBillDetail()
        {
        }
        public int Id { get; set; }
        public int PurchaseBillMasterId { get; set; }
        public int ProductBranchMappingId { get; set; }
        public int LRBookingId { get; set; }
        public decimal? Quantity1 { get; set; }
        public decimal? Quantity2 { get; set; }
        public decimal? Quantity3 { get; set; }
        public decimal? Quantity4 { get; set; }
        public decimal? Quantity5 { get; set; }
        public decimal? Quantity6 { get; set; }
        public decimal? DiscountPercentage { get; set; }
        public decimal? DiscountAmount { get; set; }
        public decimal? Rate { get; set; }
        public decimal? OtherCharges { get; set; }
        public decimal? BasicAmount { get; set; }
        public decimal? SGSTPercentage { get; set; }
        public decimal? SGSTAmount { get; set; }
        public decimal? CGSTPercentage { get; set; }
        public decimal? CGSTAmount { get; set; }
        public decimal? IGSTPercentage { get; set; }
        public decimal? IGSTAmount { get; set; }
        public decimal? GSTStateCessPercentage { get; set; }
        public decimal? GSTStateCessAmount { get; set; }
        public decimal? GSTCentralCessPercentage { get; set; }
        public decimal? GSTCentralCessAmount { get; set; }
        public string BatchNumber { get; set; }
        public System.DateTime? ExpiryDate { get; set; }
        public string ItemDesc1 { get; set; }
        public string ItemDesc2 { get; set; }
        public string ItemDesc3 { get; set; }
        public string ItemDesc4 { get; set; }
        public string ItemDesc5 { get; set; }
        public string ItemDesc6 { get; set; }
        public decimal? QuantityDiscountPercentage { get; set; }
        public decimal? QuantityDiscountAmount { get; set; }
        public decimal? SpecialDiscount1 { get; set; }
        public decimal? SpecialDiscount2 { get; set; }
        public decimal? SpecialDiscount3 { get; set; }
        public decimal? SalesQuantity { get; set; }
        public decimal? SalesRate { get; set; }
        public decimal? SalesDiscount { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public bool Received { get; set; }
    }
}
