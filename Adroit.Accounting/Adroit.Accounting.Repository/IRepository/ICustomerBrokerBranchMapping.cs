using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerBrokerBranchMapping
    {
        List<DropdownViewModel> GetCustomerBrokerBranchMappingList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
