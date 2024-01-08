//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class AccountAdminViewModel : AccountAdmin
    {
        public List<DropdownViewModel> NameList { get; set; }
        public List<DropdownViewModel> AccountGroupList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> AreaNameList { get; set; }
        public List<DropdownViewModel> TransportNameList { get; set; }

        public string AccountGroupName { get; set; }
        public string CityName { get; set; }

        public int? TalukaId { get; set; }
        public int? DistrictId { get; set; }
    }
}