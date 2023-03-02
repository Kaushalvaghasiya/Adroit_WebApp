//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerBrokerBranchMapping
    {
        public CustomerBrokerBranchMapping()
        {
        }
        public int Id { get; set; }
        public int BrokerId { get; set; }
        public int BranchId { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public string BrokerName { get; set; }
    }
}
