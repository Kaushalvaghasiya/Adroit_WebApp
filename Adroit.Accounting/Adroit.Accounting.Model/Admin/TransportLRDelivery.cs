//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class TransportLRDelivery
    {
        public TransportLRDelivery()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public byte? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
    }
}
