//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class VehicleOwnerViewModel : VehicleOwner
    {
        public List<DropdownViewModel> CountryList { get; set; }
        public List<DropdownViewModel> AccountList { get; set; }

        public string AccountName { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public short? CountryId { get; set; }
        public int? DistrictId { get; set; }
        public int? TalukaId { get; set; }
    }
}