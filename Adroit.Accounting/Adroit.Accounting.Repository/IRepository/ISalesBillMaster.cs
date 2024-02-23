using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ISalesBillMaster
    {
        List<SalesBillDetailViewModel> GetListBySalesBillMasterId(string connectionString, int salesBillMasterId, int loginId, int branchId, int firmId);
    }
}
