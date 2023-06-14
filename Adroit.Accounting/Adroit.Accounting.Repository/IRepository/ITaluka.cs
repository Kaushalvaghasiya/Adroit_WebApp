using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITaluka
    {
        List<DropdownViewModel> GetTalukaList(string connectionString, int districtId);
    }
}
