//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class DistrictViewModel : District
    {
        public List<DropdownViewModel> CountryList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> StateList { get; set; }
        public string StateId { get; set; }
        public string CountryId { get; set; }

    }
}