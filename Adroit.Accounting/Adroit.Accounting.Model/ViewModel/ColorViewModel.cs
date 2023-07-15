//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class ColorViewModel: ColorAdmin
    {
        public List<DropdownViewModel> ColorList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}