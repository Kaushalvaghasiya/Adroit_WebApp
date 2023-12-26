using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class LRDeliveryLRRegisterViewModel
    {
        public int[] BranchId { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public int ViewId { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public DateTime DateFrom { get; set; } = DateTime.Now;
        public DateTime DateTo { get; set; } = DateTime.Now;
        public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
        public int LRFrom { get; set; }
        public int LRTo { get; set; }
        public int[] CityFromId { get; set; }
        public int[] CityToId { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public int[] ConsignorId { get; set; }
        public List<DropdownViewModel> ConsignorList { get; set; }
        public int[] ConsigneeId { get; set; }
        public List<DropdownViewModel> ConsigneeList { get; set; }
        public int[] BillPartyId { get; set; }
        public List<DropdownViewModel> BillPartyList { get; set; }
        public int[] PvtMarkId { get; set; }
        public List<DropdownViewModel> PvtMarkList { get; set; }
        public int[] PayTypeId { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public int InvStatus { get; set; }
        public List<DropdownViewModel> InvStatusList { get; set; }
        public int[] VehicleNumber { get; set; }
        public List<DropdownViewModel> VehicleNumberList { get; set; }
        public int LRView { get; set; }
        public List<DropdownViewModel> LRViewList { get; set; }
        public int[] ChalanId { get; set; }
        public List<DropdownViewModel> ChalanList { get; set; }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
