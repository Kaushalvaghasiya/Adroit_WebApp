using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerUser
    {
        List<Model.CustomerUser> GetBranchWIthFirmName(int id, string connectionString);

        List<Model.CustomerUser> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0);

        void Delete(int id, int DeletedById, string connectionString);

        int Save(Model.CustomerUser customerUser, string connectionString);

        Model.CustomerUser Get(int id, string connectionString);
    }
}