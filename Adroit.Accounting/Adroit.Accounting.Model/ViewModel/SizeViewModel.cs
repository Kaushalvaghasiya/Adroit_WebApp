//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class SizeViewModel: ProductSizeAdmin
    {
        public List<DropdownViewModel> SizeList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}