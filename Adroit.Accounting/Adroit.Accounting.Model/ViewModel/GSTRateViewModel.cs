//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class GSTRateViewModel : GSTRate
    {
        public List<DropdownViewModel> RateList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}