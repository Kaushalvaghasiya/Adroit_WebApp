using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTFirmType
    {
          List<DropdownViewModel> SelectList(string connectionString);
    }
}
