//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CityViewModel : City
    {
       
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> TalukaList { get; set; }

    }
}