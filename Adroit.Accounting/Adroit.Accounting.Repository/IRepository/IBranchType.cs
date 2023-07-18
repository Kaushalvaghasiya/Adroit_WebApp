using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBranchType
    {
        List<DropdownViewModel> SelectList(string connectionString);
    }
}
