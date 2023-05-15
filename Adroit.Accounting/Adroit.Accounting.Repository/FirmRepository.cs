using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FirmRepository : IFirm
    {
        public List<CustomerFirm> GetFirmList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.CustomerFirm>("sp_FirmList_Select", connectionString, parameters);
        }
    }
}
