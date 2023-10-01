//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class DistrictViewModel : District
    {
       
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> StateList { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }

    }
}