//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class StateViewModel : State
    {

        public List<DropdownViewModel> TitleGSTRList { get; set; }
        public List<DropdownViewModel> TitleEWayList { get; set; }
        public List<DropdownViewModel> CodeList { get; set; }
        public List<DropdownViewModel> CountryList { get; set; }
        public string CountryName { get; set; }
        public string CountryId { get; set; }

    }
}