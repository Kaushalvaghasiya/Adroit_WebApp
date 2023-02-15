//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class SalesBillFromAdmin
    {
        public SalesBillFromAdmin()
        {
        }
        public string Id { get; set; }
        public string Title { get; set; }
        public bool IsDeleted { get; set; }
    }
}
