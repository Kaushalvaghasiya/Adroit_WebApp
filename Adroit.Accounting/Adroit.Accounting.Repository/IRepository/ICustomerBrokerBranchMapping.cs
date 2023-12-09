using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerBrokerBranchMapping
    {
        List<DropdownViewModel> SelectList(int branchId, string connectionString, int loginId = 0);
    }
}
