//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
        }
        public short Id { get; set; }
        public string Title { get; set; }
        public int? OrderNumber { get; set; }
        public bool Active { get; set; }
    }
}
