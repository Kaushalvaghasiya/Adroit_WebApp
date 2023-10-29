using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AccountGroupTypeRepository : IAccountGroupType
    {
        public List<DropdownViewModel> GetAccountGroupTypeList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_AccountGroupTypeList_Select", connectionString, parameters);
        }
    }
}
