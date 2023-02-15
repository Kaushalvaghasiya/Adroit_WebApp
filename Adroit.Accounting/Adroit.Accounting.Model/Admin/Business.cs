//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Business
    {
        public Business()
        {
        }
        public short Id { get; set; }
        public string Title { get; set; }
        public short? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
    }
}
