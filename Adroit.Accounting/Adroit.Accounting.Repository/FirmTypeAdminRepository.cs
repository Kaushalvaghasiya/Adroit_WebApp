using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FirmTypeAdminRepository : IFirmTypeAdmin
    {
        public List<FirmTypeAdmin> GetFirmTypeAdminList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.FirmTypeAdmin>("sp_FirmAdminTypeList_Select", connectionString, parameters);
        }

    }
}
