using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccountBranchMapping
    {
        List<DropdownViewModel> GetCustomerAccountBranchMappingList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
