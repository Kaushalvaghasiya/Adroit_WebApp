using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccountGroup
    {
        List<DropdownViewModel> GetCustomerAccountGroupList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
