//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public class UserDetail
    {
        public int ID { get; set; }
        public int CustomerId { get; set; }
        public Guid UserId { get; set; }
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public string CustomerName { get; set; } = "";
        public bool IsActive { get; set; }
        public bool IsLock { get; set; }
        public bool IsDelete { get; set; }
        public string PhoneNumber { get; set; } = "";
        public string Email { get; set; } = "";
        public string UserName { get; set; } = "";
        public int AddedById { get; set; }
        public int OwnerBranchId { get; set; }
        public int? ModifiedById { get; set; }
    }
}