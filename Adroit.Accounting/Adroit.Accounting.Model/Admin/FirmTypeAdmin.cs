//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class FirmTypeAdmin
    {
        public FirmTypeAdmin()
        {
        }
        public short Id { get; set; }
        public string Title { get; set; }
        public short? OrderNumber { get; set; }
    }
}
