//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Z_LRBooking_Z
    {
        public Z_LRBooking_Z()
        {
        }
    
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int BookBranchMappingId { get; set; }
        public int LRNumber { get; set; }
        public System.DateTime LRDate { get; set; }
        public int? VehicleId { get; set; }
        public int CityIdFrom { get; set; }
        public int CityIdTo { get; set; }
        public int DeliveryAccountBranchMappingId { get; set; }
        public int? BillAccountBranchMappingId { get; set; }
        public string EwayBillNo { get; set; }
        public System.DateTime? ValidDateFrom { get; set; }
        public System.DateTime? ValidDateTo { get; set; }
        public byte LRPayTypeId { get; set; }
        public string InvoiceNo { get; set; }
        public decimal? InvoiceValue { get; set; }
        public string PrivateMarka { get; set; }
        public short? Parcel { get; set; }
        public decimal? ActualWeight { get; set; }
        public decimal? ChargeWeight { get; set; }
        public int? DescriptionId { get; set; }
        public int? PackingId { get; set; }
        public byte LRRateOnId { get; set; }
        public decimal? Rate { get; set; }
        public decimal? Freight { get; set; }
        public decimal? Charges1 { get; set; }
        public decimal? Charges2 { get; set; }
        public decimal? Charges3 { get; set; }
        public decimal? Charges4 { get; set; }
        public decimal? Charges5 { get; set; }
        public decimal? Charges6 { get; set; }
        public int ProductBranchMappingId { get; set; }
        public string Remarks { get; set; }
        public byte LRDeliveryId { get; set; }
        public byte LRDeliveryTypeId { get; set; }
        public bool IsSaleBilled { get; set; }
        public System.DateTime? ArrivalDate { get; set; }
        public System.DateTime? DeliveryDate { get; set; }
        public bool IsDispatched { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
