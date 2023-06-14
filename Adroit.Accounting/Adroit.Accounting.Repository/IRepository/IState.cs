using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IState
    {
        List<DropdownViewModel> GetStateList(string connectionString, int countryId);
    }
}
