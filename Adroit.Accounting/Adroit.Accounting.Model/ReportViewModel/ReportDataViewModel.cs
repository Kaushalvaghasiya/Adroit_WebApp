using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public partial class ReportDataViewModel<T>
    {
        public ReportHeaderViewModel ReportHeader { get; set; }
        public T ReportData { get; set; }
    }
}
