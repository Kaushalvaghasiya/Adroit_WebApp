//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class TalukaViewModel : Taluka
    {
       
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> DistrictList { get; set; }

    }
}