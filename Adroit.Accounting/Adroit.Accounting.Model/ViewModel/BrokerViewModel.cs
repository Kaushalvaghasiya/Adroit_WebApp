﻿//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using System.Reflection.Metadata;

namespace Adroit.Accounting.Model.ViewModel
{
    public class BrokerViewModel : Broker
    {
        public short? CountryId { get; set; }
        public int? StateId { get; set; }
        public int? DistrictId { get; set; }
        public int? TalukaId { get; set; }        
        public string? CityName { get; set; }
        public List<DropdownViewModel> BrokerNameList { get; set; }
        public List<DropdownViewModel> BrokerageList { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public string? CustomerBrokerBranchIds { get; set; } //Comma separated
    }
}