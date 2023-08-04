//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using System.Text.RegularExpressions;

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerUserViewModel : CustomerUser
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public CustomerViewModel Customer { get; set; }
        public string CustomerUserBranches { get; set; }
        public string FullName { get { return $"{this.FirstName} {this.LastName}"; } }
        public string MaskedEmail
        {
            get
            {
                string pattern = @"(?<=[\w]{1})[\w\-._\+%]*(?=[\w]{1}@)";
                return Regex.Replace(this.Email, pattern, m => new string('*', m.Length));
            }
        }
    }
}