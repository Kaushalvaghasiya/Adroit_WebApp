using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FirmBranchTypeAdminRepository : IFirmBranchTypeAdmin
    {
        public List<FirmBranchTypeAdmin> GetFirmBranchTypeAdminList(string connectionString)
        {
            var parameters = new DynamicParameters();
            
            return QueryHelper.GetList<Model.FirmBranchTypeAdmin>("sp_FirmBranchTypeAdminList_Select", connectionString, parameters);
        }
    }
}
