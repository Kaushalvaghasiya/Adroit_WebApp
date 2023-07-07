using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICity
    {
        List<DropdownViewModel> SelectList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0);
    }
}
