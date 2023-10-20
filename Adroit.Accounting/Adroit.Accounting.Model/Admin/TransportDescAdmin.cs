//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class TransportDescAdmin
    {
        public TransportDescAdmin()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public byte? OrderNumber { get; set; }
        public bool Active { get; set; }
        public bool Deleted { get; set; }
    }
}
