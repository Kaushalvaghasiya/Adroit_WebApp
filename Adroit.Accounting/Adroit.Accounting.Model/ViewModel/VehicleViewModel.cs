//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class VehicleViewModel : Vehilcle
    {
        public List<DropdownViewModel> CustomerList { get; set; }
        public List<DropdownViewModel> VehicleModelList { get; set; }
        public List<DropdownViewModel> VehicleRegistrationStateList { get; set; }
        public List<DropdownViewModel> VehicleOwnerList { get; set; }
    }
}