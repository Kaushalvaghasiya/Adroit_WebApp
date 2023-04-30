//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class RegistrationViewModel
    {
        public string Name { get; set; } = string.Empty;
        public string BusinessName { get; set; } = string.Empty;
        public short BusinessId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public string Mobile { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string? Requirement { get; set; }
        public bool AgreeTerms { get; set; }
        public List<DropdownViewModel>? CountryList { get; set; }
        public List<DropdownViewModel>? BusinessList { get; set; }
    }
}