//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTUQC
    {
        public GSTUQC()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public string Code { get; set; }
        public string CodeEWayBill { get; set; }
        public byte? OrderNumber { get; set; }
        public bool Active { get; set; }
    }
}
