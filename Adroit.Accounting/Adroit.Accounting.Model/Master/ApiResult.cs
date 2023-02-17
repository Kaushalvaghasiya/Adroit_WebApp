using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Model.Master
{
    public class ApiResult
    {
        public string result { get; set; }
        public object data { get; set; }
        public object otherdata { get; set; }
        public string redirectURL { get; set; }
    }
}
