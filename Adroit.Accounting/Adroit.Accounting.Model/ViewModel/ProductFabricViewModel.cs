//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class ProductFabricViewModel : ProductFabric
    {
        public string Customer { get; set; }
        public List<DropdownViewModel> CustomerList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}