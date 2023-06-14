using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICountry
    {
        List<DropdownViewModel> GetCountryList(string connectionString);
    }
}
