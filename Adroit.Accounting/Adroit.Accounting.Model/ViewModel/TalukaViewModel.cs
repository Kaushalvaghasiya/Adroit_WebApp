//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class TalukaViewModel : Taluka
    {
        public List<DropdownViewModel> CountryList { get; set; }
        public string DistrictName { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }
        public string StateId { get; set; }
        public string CountryId { get; set; }
    }
}