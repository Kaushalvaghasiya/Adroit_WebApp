using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRRegisterViewModel : LRBookingViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> PvtMarkList { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public List<DropdownViewModel> InvStatusList { get; set; }
        // LRRegister Report
        public string BranchName { get; set; }
    }
}
