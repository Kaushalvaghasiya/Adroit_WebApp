//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Product
    {
        public Product()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Title { get; set; }
        public string Code { get; set; }
        public string PrintName { get; set; }
        public string TitleAlternate { get; set; }
        public int? DesignNumberId { get; set; }
        public int? ColourId { get; set; }
        public int? SizeId { get; set; }
        public int? PackingId { get; set; }
        public int? ShadeNumberId { get; set; }
        public int? FabricId { get; set; }
        public int? GroupId { get; set; }
        public int? SubGroupId { get; set; }
        public int StockTypeId { get; set; }
        public int? QualityTypeId { get; set; }
        public byte UQCId { get; set; }
        public string HSNCode { get; set; }
        public short? CategoryId { get; set; }
        public decimal? DenierWeight { get; set; }
        public decimal? RatePerMeter { get; set; }
        public decimal? RateRetail { get; set; }
        public decimal? Mrp { get; set; }
        public decimal? DistributorRate { get; set; }
        public decimal? DealerRate { get; set; }
        public decimal? PurchaseRate { get; set; }
        public decimal? Cut { get; set; }
        public decimal? AveragePack { get; set; }
        public decimal? BoxPack { get; set; }
        public decimal? RolMin { get; set; }
        public decimal? RolMax { get; set; }
        public byte GSTCalculationId { get; set; }
        public byte GSTRateId { get; set; }
        public decimal GstCentralCess { get; set; }
        public decimal GstStateCess { get; set; }
        public short AmountCalcId { get; set; }
        public bool IsDeleted { get; set; }
        public bool RateUpdate { get; set; }
        public decimal Discount { get; set; }
        public string HSNDesc { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public bool IsActive { get; set; }
    }
}
