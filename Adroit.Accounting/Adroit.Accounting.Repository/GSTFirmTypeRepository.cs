using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTFirmTypeRepository : IGSTFirmType
    {
        public List<GSTFirmType> GetGSTFirmTypeList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.GSTFirmType>("sp_GSTTypeFirmTypeList_Select", connectionString, parameters);
        }
    }
}
