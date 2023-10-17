//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class ProductAmtCalcOnViewModel : ProductAmtCalcOn
    {
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> SoftwareList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
        public string SoftwareName { get; set; }
    }
}
