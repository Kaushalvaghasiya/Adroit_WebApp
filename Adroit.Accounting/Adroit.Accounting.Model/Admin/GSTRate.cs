//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTRate
    {
        public GSTRate()
        {
        }
        public byte Id { get; set; }
        public decimal Rate { get; set; }
        public byte? OrderNumber { get; set; }
        public bool Active { get; set; }
    }
}
