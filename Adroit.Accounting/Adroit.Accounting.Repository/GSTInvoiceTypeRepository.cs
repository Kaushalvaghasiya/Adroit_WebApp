using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTInvoiceTypeRepository : IGSTInvoiceType
    {
        public List<Model.GSTInvoiceType> GetGSTInvoiceTypeList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.GSTInvoiceType>("sp_GSTInvoiceTypeList_Select", connectionString, parameters);
        }
    }
}
