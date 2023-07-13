using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IFirmType
    {
        List<DropdownViewModel> SelectList(string connectionString);
    }
}
