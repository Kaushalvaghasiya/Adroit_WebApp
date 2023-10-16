//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTReason
    {
        public GSTReason()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public string Code { get; set; }
        public byte? OrderNumber { get; set; }
    }
}
