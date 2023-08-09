//--//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerUser
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public Guid? UserId { get; set; }
        public string Email { get; set; }
        public bool Active { get; set; }
        public bool IsLocked { get; set; }
        public int? AddedById { get; set; }
        public DateTime AddedOn { get; set; }
        public int? ModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int? DeletedById { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int? OwnerBranchId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool AllowUpdateUserMenuSettingToCustomer { get; set; }
        public string CustomerUserBranchIds { get; set; } //Comma separated
    }
}