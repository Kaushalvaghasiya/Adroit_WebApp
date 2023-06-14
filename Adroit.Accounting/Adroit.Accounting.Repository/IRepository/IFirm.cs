using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IFirm
    {
        List<DropdownViewModel> GetFirmList(string connectionString);
    }
}
