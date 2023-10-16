//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTTransportMode
    {
        public GSTTransportMode()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public byte? OrderNumber { get; set; }
    }
}
