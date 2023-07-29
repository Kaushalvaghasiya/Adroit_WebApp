//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmViewModel : CustomerFirm
    {
        public List<DropdownViewModel> GSTFirmTypeList { get; set; }
        public List<DropdownViewModel> FirmTypeList { get; set; }
        public List<DropdownViewModel> BusinessList { get; set; }
        public List<DropdownViewModel> SoftwareList { get; set; }
        public CustomerViewModel Customer { get; set; }
        public string FirmType { get; set; }
        public string SoftwareName { get; set; }
        public int NumberOfBranchesCreated { get; set; }
    }
}