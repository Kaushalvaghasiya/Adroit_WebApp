//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class ProductQualityType
    {
        public ProductQualityType()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public int? OrderNumber { get; set; }
        public bool Active { get; set; }
    }
}
