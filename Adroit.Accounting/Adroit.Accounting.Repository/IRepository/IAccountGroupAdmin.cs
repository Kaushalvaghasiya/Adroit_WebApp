using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAccountGroupAdmin
    {
        List<DropdownViewModel> GetAccountGroupAdmin_SelectList(string connectionString);
    }
}
