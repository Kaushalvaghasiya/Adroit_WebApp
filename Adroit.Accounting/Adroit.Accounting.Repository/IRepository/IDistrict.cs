using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IDistrict
    {
        List<DropdownViewModel> GetDistrictList(string connectionString, int stateId);
    }
}
