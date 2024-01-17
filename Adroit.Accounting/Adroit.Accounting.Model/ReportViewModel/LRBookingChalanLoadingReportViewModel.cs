﻿using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRBookingChalanLoadingReportViewModel : PurchaseBillMasterViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> VehicleNumberList { get; set; }
        public string GroupingColumn { get; set; }
        public int SelectedView { get; set; }
        public string BranchIds { get; set; }
        public int ViewId { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        //public string DateFromString { get { return this.DateFrom.ToString("dd/MM/yyyy"); } }
        //public string DateToString { get { return this.DateTo.ToString("dd/MM/yyyy"); } }
        public string CityFromIds { get; set; }
        public string CityToIds { get; set; }
        public int ChalanFrom { get; set; }
        public int ChalanTo { get; set; }
        public string VehicleNumber { get; set; }
        public string VehicleOwner { get; set; }
        public string Agent { get; set; }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
    }
}
