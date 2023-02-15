//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class AccountGroupAdmin
    {
        public AccountGroupAdmin()
        {
        }
    
        public int Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public byte TypeId { get; set; }
        public int? AccountGroupHeaderId { get; set; }
        public int? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
    }
}
