//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class SoftwarePlan
    {
        public SoftwarePlan()
        {
        }
        public byte Id { get; set; }
        public byte SoftwareId { get; set; }
        public string Title { get; set; }
        public string Business { get; set; }
        public string Code { get; set; }
        public decimal Cost { get; set; }
        public bool Active { get; set; }
    }
}
