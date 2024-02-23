using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository
{
    public class SalesBillMasterRepository : ISalesBillMaster
    {
        public List<SalesBillDetailViewModel> GetListBySalesBillMasterId(string connectionString, int salesBillMasterId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@SalesBillMasterId", salesBillMasterId);
            return QueryHelper.GetList<SalesBillDetailViewModel>("sp_InvoiceGetLRBookingTableListBySalesBillMasterId", connectionString, parameters);
        }
    }
}
