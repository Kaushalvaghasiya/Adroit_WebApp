using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FinanceYearRepository : IFinanceYear
    {
        public List<DropdownViewModel> SelectList(string connectionString, int BranchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", BranchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_FinanceYearList_Select", connectionString, parameters);
        }
    }
}