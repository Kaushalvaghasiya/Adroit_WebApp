//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.Enums;
using System.Text.Json.Serialization;

namespace Adroit.Accounting.Model
{
    public partial class Customer
    {
        public Customer()
        {
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string BusinessName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public int CityId { get; set; }
        public int? StateId { get; set; }
        public string Pincode { get; set; }
        public string ContactPersonName { get; set; }
        public string Mobile { get; set; }
        public string MobileOtp { get; set; }
        public string MobileAlternate { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string EmailOtp { get; set; }
        public short BusinessId { get; set; }
        public string Requirement { get; set; }
        public short? TotalFirm { get; set; }

        [JsonConverter(typeof(JsonStringEnumConverter))]
        public CustomerType CustomerType { get; set; }

        public string AdharUID { get; set; }
        public short TotalUsers { get; set; }
        public bool Active { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))]
        public CustomerStatus StatusId { get; set; }
        public bool AgreeTerms { get; set; }
        public Guid DefaultUserId { get; set; }
    }
}