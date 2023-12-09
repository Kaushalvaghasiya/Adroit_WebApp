using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccountBranchMapping
    {
        List<DropdownViewModel> GetCustomerAccountBranchMappingList(int firmId, int branchId, string connectionString, int loginId = 0);
    }
}
