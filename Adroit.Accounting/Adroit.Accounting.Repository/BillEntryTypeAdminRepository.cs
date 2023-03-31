using Adroit.Accounting.Model;
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
    public class BillEntryTypeAdminRepository : IBillEntryTypeAdmin
    {
        public List<Model.BillEntryTypeAdmin> GetBillEntryTypeAdminList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<Model.BillEntryTypeAdmin>("sp_BillEntryTypeAdminList_Select", connectionString, parameters);
        }
    }
}
