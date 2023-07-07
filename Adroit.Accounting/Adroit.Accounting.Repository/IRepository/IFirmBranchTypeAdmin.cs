using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IFirmBranchTypeAdmin
    {
        List<DropdownViewModel> SelectList(string connectionString);
    }
}
