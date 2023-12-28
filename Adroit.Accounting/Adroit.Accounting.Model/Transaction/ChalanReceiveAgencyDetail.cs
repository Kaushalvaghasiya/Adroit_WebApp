using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.Transaction
{
    public class ChalanReceiveAgencyDetail
    {
        public int Id { get; set; }
        public int ChalanReceiveAgencyMasterId { get; set; }
        public int SenderBranchAccountMappingid { get; set; }
        public int SrNumber { get; set; }
        public string? EwayBillNo { get; set; }
        public string? LRNumber { get; set; }

        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime LRDate { get; set; }
        public string? PrivateMarka { get; set; }
        public int CityIDFrom { get; set; }
        public int ToCityId { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int DeliveryAccountBranchMappingId { get; set; }
        public int LRPayTypeId { get; set; }
        public int? Parcel { get; set; }
        public decimal? ChargeWeight { get; set; }
        public int? BillAccountBranchMappingId { get; set; }
        public decimal? NetAmount { get; set; }
        
        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? ModifiedById { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? ModifiedOn { get; set; }
        public bool Deleted { get; set; }
        public int? DeletedById { get; set; }
        [JsonConverter(typeof(CustomNullableDateTimeConverter))]
        public System.DateTime? DeletedOn { get; set; }
    }
}
