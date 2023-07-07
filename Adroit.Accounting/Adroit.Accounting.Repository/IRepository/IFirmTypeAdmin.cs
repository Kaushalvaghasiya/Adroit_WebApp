using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IFirmTypeAdmin
    {
        List<DropdownViewModel> SelectList(string connectionString);
    }
}
