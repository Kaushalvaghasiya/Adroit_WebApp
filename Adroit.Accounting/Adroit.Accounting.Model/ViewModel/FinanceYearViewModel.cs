//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class FinanceYearViewModel : FinanceYear
    {
        public List<DropdownViewModel> FinanceYearList { get; set; }
        public List<DropdownViewModel> CustomerFirmList { get; set; }
    }
}