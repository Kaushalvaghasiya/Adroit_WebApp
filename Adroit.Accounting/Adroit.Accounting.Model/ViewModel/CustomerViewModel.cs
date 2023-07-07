//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerViewModel : Customer
    {
        public List<DropdownViewModel> BusinessList { get; set; }
        //public List<DropdownViewModel> SoftwareList { get; set; }
        public List<DropdownViewModel> CountryList { get; set; }
        public List<DropdownViewModel> CustomerTypeList { get; set; }
        public List<DropdownViewModel> StatusList { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string District { get; set; }
        public string Taluka { get; set; }
        public int? CountryId { get; set; }
        public int? DistrictId { get; set; }
        public int? TalukaId { get; set; }
        public int NumberOfFirmsCreated { get; set; }

        public int CustomerTypeId { get { return (byte)this.CustomerType; } }
        public int StatusTypeId { get { return (byte)this.StatusId; } }
    }
}