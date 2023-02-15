//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class AccountGroupType
    {
        public AccountGroupType()
        {
        }
        public byte Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public int? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
    }
}
