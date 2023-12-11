using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerInvoiceRepository : ICustomerInvoice
    {
        //public List<DropdownViewModel> GetProductList(string connectionString, int loginId = 0, int firmId = 0)
        //{
        //    var parameters = new DynamicParameters();
        //    parameters.Add("@loginId", loginId);
        //    parameters.Add("@firmId", firmId);
        //    return QueryHelper.GetList<DropdownViewModel>("", connectionString, parameters);
        //}

        //public int Save(CustomerInvoiceViewModel value, string connectionString, int firmId = 0)
        //{

        //    //return QueryHelper.Save("", connectionString, parameters);
        //}

        public bool Delete(int id, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Delete("sp_CustomerInvoiceDelete", connectionString, parameters);
        }

        //public CustomerInvoiceViewModel Get(int id, string connectionString, int loginId, int firmId = 0)
        //{
        //    var parameters = new DynamicParameters();
        //    parameters.Add("@Id", id);
        //    parameters.Add("@loginId", loginId);
        //    parameters.Add("@firmId", firmId);
        //    return QueryHelper.Get<ProductViewModel>("", connectionString, parameters);
        //}

        public List<SalesBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SalesBillMasterGridViewModel>("sp_CustomerInvoiceList", connectionString, parameters);
        }
    }
}
