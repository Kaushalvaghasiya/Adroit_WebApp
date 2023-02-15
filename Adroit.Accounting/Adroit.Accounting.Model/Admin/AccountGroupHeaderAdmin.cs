//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class AccountGroupHeaderAdmin
    {
        public AccountGroupHeaderAdmin()
        {
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public int? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
    }
}
