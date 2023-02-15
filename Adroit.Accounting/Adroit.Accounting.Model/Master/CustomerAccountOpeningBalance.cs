//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerAccountOpeningBalance
    {
        public CustomerAccountOpeningBalance()
        {
        }
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int YearId { get; set; }
        public string Type { get; set; }
        public decimal Amount { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
    }
}
