//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class VehicleViewModel : Vehilcle
    {
        public string ModelName { get; set; }
        public string OwnerName { get; set; }
        public string StateTitle { get; set; }
        public short? CountryId { get; set; }
        public List<DropdownViewModel> CustomerList { get; set; }
        public List<DropdownViewModel> VRNList { get; set; }
        public List<DropdownViewModel> CountryList { get; set; }

        public List<DropdownViewModel> VehicleModelList { get; set; }
        public List<DropdownViewModel> VehicleRegistrationStateList { get; set; }
        public List<DropdownViewModel> VehicleOwnerList { get; set; }

        public string RegistrationDateString { get { return this.RegistrationDate?.ToString(Constant.DateFormat) ?? ""; } }

        public string StatePermitIssueOnString { get { return this.StatePermitIssueOn?.ToString(Constant.DateFormat) ?? ""; } }
        public string StatePermitExpiryString { get { return this.StatePermitExpiry?.ToString(Constant.DateFormat) ?? ""; } }

        public string NationalPermitIssueOnString { get { return this.NationalPermitIssueOn?.ToString(Constant.DateFormat) ?? ""; } }
        public string NationalPermitExpiryString { get { return this.NationalPermitExpiry?.ToString(Constant.DateFormat) ?? ""; } }

        public string InsuranceIssueOnString { get { return this.InsuranceIssueOn?.ToString(Constant.DateFormat) ?? ""; } }
        public string InsuranceExpiryString { get { return this.InsuranceExpiry?.ToString(Constant.DateFormat) ?? ""; } }
    }
}