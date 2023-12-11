using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IFinanceYear
    {
        List<DropdownViewModel> SelectList(string connectionString, int BranchId);
    }
}
