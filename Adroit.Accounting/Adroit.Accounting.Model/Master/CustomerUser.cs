//--//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerUser : BaseModel
    {
        public CustomerUser()
        {
        }

        public int Id { get; set; }
        public string? Title { get; set; }
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public Guid? UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public bool IsLocked { get; set; }
        public bool IsDeleted { get; set; }
        public int? AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? OwnerBranchId { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public string BranchCSV { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? CustomerUserBranch { get; set; }
    }
}