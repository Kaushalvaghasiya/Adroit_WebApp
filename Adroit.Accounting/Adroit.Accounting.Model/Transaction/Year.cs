//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Year
    {
        public Year()
        {
        }
        public int Id { get; set; }
        public int FirmId { get; set; }
        public string Title { get; set; }
        public DateTime YearFrom { get; set; }
        public DateTime YearTo { get; set; }
        public bool Deleted { get; set; }
        public bool Active { get; set; }
    }
}
