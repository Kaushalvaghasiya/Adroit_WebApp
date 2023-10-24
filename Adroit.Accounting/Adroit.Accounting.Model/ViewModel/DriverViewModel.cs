//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using System.Reflection.Metadata;

namespace Adroit.Accounting.Model.ViewModel
{
    public class DriverViewModel : Driver
    {
        public short? CountryId { get; set; }
        public int? DistrictId { get; set; }
        public int? TalukaId { get; set; }
        public string DriverType { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string LicenceIssuePlace { get; set; }
        public List<DropdownViewModel> DriverNameList { get; set; }
        public List<DropdownViewModel> CustomerList { get; set; }
        public List<DropdownViewModel> CountryList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> MobileNoList { get; set; }
        public List<DropdownViewModel> LicenceNumberList { get; set; }
        public List<DropdownViewModel> PinCodeList { get; set; }
        public List<DropdownViewModel> LicenceIssuePlaceList { get; set; }
        public List<DropdownViewModel> AadharUIDList { get; set; }
        public List<DropdownViewModel> DriverTypeList { get; set; }
        public string LicenceExpiryString { get { return this.LicenceExpiry.ToString(Constant.DateFormat); } }
    }
}