using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class SoftwareTypeRepository : ISoftwareType
    {
        public List<Software> GetSoftwareTypeList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.Software>("sp_SoftwareList_Select", connectionString, parameters);
        }
    }
}
