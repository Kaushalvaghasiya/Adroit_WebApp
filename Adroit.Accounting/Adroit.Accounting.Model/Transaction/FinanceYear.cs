//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class FinanceYear
    {
        public FinanceYear()
        {
        }
        public int Id { get; set; }
        public int FirmId { get; set; }
        public string Title { get; set; }
        public System.DateTime YearFrom { get; set; }
        public System.DateTime YearTo { get; set; }
        public bool IsDeleted { get; set; }
    }
}
