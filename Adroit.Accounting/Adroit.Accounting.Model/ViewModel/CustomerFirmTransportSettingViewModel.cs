//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmTransportSettingViewModel : CustomerFirmTransportSetting
    {
        public List<DropdownViewModel> CustomerFirmList { get; set; }
        public List<DropdownViewModel> ProductList { get; set; }
        public List<DropdownViewModel> TransportLRChargesList { get; set; }
        public CustomerViewModel? Customer { get; set; }

    }
}
