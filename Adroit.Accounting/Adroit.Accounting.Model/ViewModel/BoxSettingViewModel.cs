//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class BoxSettingViewModel : BoxSetting
    {
        public List<DropdownViewModel> SoftwareList { get; set; }
        public string SoftwareTitle { get; set; }
        public string CustomerName { get; set; }
        public string CustomerFirmTitle { get; set; }
        public DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
    }
}