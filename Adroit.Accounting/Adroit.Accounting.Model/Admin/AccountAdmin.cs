//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class AccountAdmin
    {
        public AccountAdmin()
        {
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string PrintName { get; set; }
        public int AccountGroupId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public short? CountryId { get; set; }
        public string Pincode { get; set; }
        public string KM { get; set; }
        public string ContactPersonName { get; set; }
        public string Mobile { get; set; }
        public string MobileAlternate { get; set; }
        public string Email { get; set; }
        public string GSTNumber { get; set; }
        public string PAN { get; set; }
        public string AreaName { get; set; }
        public bool RateWithGST { get; set; }
        public byte GSTInvoiceTypeId { get; set; }
        public string EximCode { get; set; }
        public bool IsIGST { get; set; }
        public string GSTNumberTransport { get; set; }
        public string TransportName { get; set; }
        public string VehicleNumber { get; set; }
        public int? DeliveryId { get; set; }
        public int? ShippingId { get; set; }
        public int? BrokerId { get; set; }
        public short CreditDays { get; set; }
        public decimal Discount { get; set; }
        public decimal TDS { get; set; }
        public decimal TCS { get; set; }
        public decimal CreditLimit { get; set; }
        public decimal InterestRate { get; set; }
        public decimal Commission { get; set; }
        public bool IsEcommerce { get; set; }
        public string AdharUID { get; set; }
        public string TAN { get; set; }
        public bool CompositParty { get; set; }
        public bool RCMParty { get; set; }
        public decimal CapitalPercentage { get; set; }
        public bool Active { get; set; }
    }
}
