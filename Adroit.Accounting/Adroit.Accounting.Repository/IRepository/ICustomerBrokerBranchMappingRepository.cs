using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerBrokerBranchMappingRepository
    {
        List<CustomerBrokerBranchMapping> GetCustomerBrokerBranchMappingList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
