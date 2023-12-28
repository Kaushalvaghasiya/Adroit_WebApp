using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.Transaction
{
    public class ChalanReceiveAgencyMaster
    {
        public int Id { get; set; }
        public int BranchId { get; set; }
        public int FirmId { get; set; }
        public int YeardId { get; set; }
        public int SenderBranchAccountMappingid { get; set; }

        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime ArrivalDate { get; set; }
        public int BillNumberBranch { get; set; }
        public string BillNumberFirm { get; set; }
        public string FirmChalanNumber { get; set; }

        [JsonConverter(typeof(CustomDateTimeConverter))]
        public System.DateTime FirmChalanDate { get; set; }
        public int CityIDFrom { get; set; }
        public int ToCityId { get; set; }
        public int? VehicaleID { get; set; }
        public int? BillAccountBranchMappingId { get; set; }
        public int? DriverId { get; set; }
        public string? EwayBillNo { get; set; }
        public int GoDownNumber { get; set; }
        public decimal? ToPayAmount { get; set; }
        public decimal? CrossingAmount { get; set; }
        public decimal? CrossingCommission { get; set; }
        public decimal? CrossingHamali { get; set; }
        public decimal? CrossingDeliveryCharge { get; set; }
        public decimal? BrokerAmount { get; set; }
        public int? ToPayAccountBranchMappingId { get; set; }
        public int? CrossingAmountAccountBranchMappingId { get; set; }
        public int? CrossingCommissionAccountBranchMappingId { get; set; }
        public int? CrossingHamaliAccountBranchMappingId { get; set; }
        public int? CrossingDeliveryAccountBranchMappingId { get; set; }
        public int? BrokerBranchMappingId { get; set; }
        public decimal? TaxableAmount { get; set; }
        public decimal? TDSPercent { get; set; }
        public decimal? TDSAmount { get; set; }
        public decimal? AdvanceCash { get; set; }
        public decimal? AdvanceNeft { get; set; }
        public decimal? ReceiveCash { get; set; }
        public decimal? OtherPlus { get; set; }
        public decimal? OtherLess { get; set; }
        public string? Notes { get; set; }

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
