//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using System.Text.Json.Serialization;

namespace Adroit.Accounting.Model
{
    public partial class Vehilcle
    {
        public Vehilcle()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string VRN { get; set; }
        public short ModelId { get; set; }
        public string ChasisNumber { get; set; }
        public string EngineNumber { get; set; }
        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime RegistrationDate { get; set; }
        public int StateId { get; set; }
        public string StatePermitNumber { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? StatePermitIssueOn { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? StatePermitExpiry { get; set; }
        public string NationalPermitNumber { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? NationalPermitIssueOn { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? NationalPermitExpiry { get; set; }
        public string InsuranceNumber { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? InsuranceIssueOn { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? InsuranceExpiry { get; set; }
        public int OwnerId { get; set; }
        public int AddedById { get; set; }
        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? ModifiedOn { get; set; }
        public bool Active { get; set; }
    }
}
