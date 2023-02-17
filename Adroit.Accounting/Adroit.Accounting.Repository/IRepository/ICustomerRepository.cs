using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerRepository
    {
        int Save(Customer customer, string connectionString);
        Customer Get(string email, string connectionString);
        Customer Get(int id, string connectionString);
        List<UserDetail> List(string connectionString, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
    }
}
