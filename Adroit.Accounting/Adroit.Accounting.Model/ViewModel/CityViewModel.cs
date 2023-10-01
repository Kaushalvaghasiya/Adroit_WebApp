//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CityViewModel : City
    {
       
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> TalukaList { get; set; }
        public string TalukaName { get; set; }
        public string DistrictName { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }
    }
}