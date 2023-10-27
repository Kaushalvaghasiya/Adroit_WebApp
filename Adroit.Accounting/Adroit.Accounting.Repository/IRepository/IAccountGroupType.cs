using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAccountGroupType
    {
        List<DropdownViewModel> GetAccountGroupTypeList(string connectionString);
    }
}