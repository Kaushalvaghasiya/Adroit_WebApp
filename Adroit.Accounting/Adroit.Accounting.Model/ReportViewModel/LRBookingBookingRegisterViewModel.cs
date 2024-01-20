using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class LRBookingBookingRegisterViewModel : LRBookingViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public List<DropdownViewModel> ChalanList { get; set; }
        public List<DropdownViewModel> InvStatusList { get; set; }
        public string GroupingColumn { get; set; }
        public int SelectedView { get; set; }
        public string BranchIds { get; set; }
        public int ViewId { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int LRFrom { get; set; }
        public int LRTo { get; set; }
        public string CityFromIds { get; set; }
        public string CityToIds { get; set; }
        public string ConsignorIds { get; set; }
        public string ConsigneeIds { get; set; }
        public string BillPartyIds { get; set; }
        public string PayTypeIds { get; set; }
        public string ChalanId { get; set; }
        public int InvStatusId { get; set; }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
