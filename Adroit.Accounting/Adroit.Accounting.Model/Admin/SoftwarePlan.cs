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
        public string Title { get; set; } = string.Empty;
        public string Business { get; set; } = string.Empty;
        public string Code { get; set; } = string.Empty;
        public bool IsDeleted { get; set; }
        public decimal Cost { get; set; }
    }
}
