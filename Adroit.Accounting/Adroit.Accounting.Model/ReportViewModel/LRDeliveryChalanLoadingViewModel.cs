using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class LRDeliveryChalanLoadingViewModel
    {
        public int[] BranchId { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public int ViewId { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public int[] ChalanId { get; set; }
        public List<DropdownViewModel> ChalanList { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
        public int ChalanFrom { get; set; }
        public int ChalanTo { get; set; }
        public int[] CityFromId { get; set; }
        public int[] CityToId { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public int[] VehicleNumber { get; set; }
        public List<DropdownViewModel> VehicleNumberList { get; set; }
        public int[] VehicleOwner { get; set; }
        public List<DropdownViewModel> VehicleOwnerList { get; set; }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
