using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class ReportHeaderViewModel
    {
        public string? BranchName { get; set; }
        public string? SelectedBranchNames { get; set; }
        public string? FrimName { get; set; }
        public string? BranchAddress { get; set; }
        public bool? Subtotal { get; set; }
        public DateTime? DateFrom { get; set; }
        public string DateFromString { get { return this.DateFrom?.ToString(Adroit.Accounting.Model.Constant.DateFormat) ?? ""; } }
        public DateTime? DateTo { get; set; }
        public string DateToString { get { return this.DateTo?.ToString(Adroit.Accounting.Model.Constant.DateFormat)?? ""; } }
        public int Year { get; set; }
    }
}
