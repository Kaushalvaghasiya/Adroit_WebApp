﻿//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class BusinessViewModel : Business
    {
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
        public List<DropdownViewModel> SoftwareList { get; set; }

        public string SoftwareName { get; set; }
    }
}