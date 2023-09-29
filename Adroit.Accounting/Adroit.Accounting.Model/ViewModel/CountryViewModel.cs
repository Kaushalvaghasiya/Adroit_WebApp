//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CountryViewModel : Country
    {
       
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> PhoneCodeLsit { get; set; }

    }
}