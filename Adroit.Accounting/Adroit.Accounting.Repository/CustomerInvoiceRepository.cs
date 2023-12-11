using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerInvoiceRepository : ICustomerInvoice
    {
        public List<DropdownViewModel> GetProductList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("", connectionString, parameters);
        }

        public int Save(CustomerInvoiceViewModel value, string connectionString, int firmId = 0)
        {

            return QueryHelper.Save("", connectionString, parameters);
        }
        public void Delete(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            QueryHelper.Save("", connectionString, parameters);
        }

        public CustomerInvoiceViewModel Get(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.Get<ProductViewModel>("", connectionString, parameters);
        }

        public List<CustomerInvoiceViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@loginId", loginId);
            param.Add("@firmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductGridViewModel>("sp_CustomerInvoiceList", connectionString, param);
        }
    }
}
