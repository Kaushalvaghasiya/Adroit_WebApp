using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerGeneralExpensesMultiRepository : ICustomerGeneralExpensesMulti
    {
        public PurchaseBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.Get<PurchaseBillMasterViewModel>("sp_CustomerGeneralExpensesMultiGet", connectionString, parameters);
        }
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<PurchaseBillMasterGridViewModel>("sp_CustomerGeneralExpensesMultiList", connectionString, parameters);
        }

        public CustomerBookViewModel GetListWithIsGeneralPurchaseId(string connectionString, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<CustomerBookViewModel>("sp_GetListWithIsGeneralPurchaseId", connectionString, parameters);
        }
        public ProductViewModel CustomerGeneralExpenseMultiSearchProductDescList(string connectionString, string search, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Search", search);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<ProductViewModel>("sp_CustomerGeneralExpensesMultiGetProductGroupListBySearch", connectionString, parameters);
        }
    }
}
