using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBusiness
    {
        List<DropdownViewModel> GetBusinessList(string connectionString);
    }
}
