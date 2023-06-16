//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class BusinessViewModel : Business
    {
        public List<DropdownViewModel> BusinessList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}