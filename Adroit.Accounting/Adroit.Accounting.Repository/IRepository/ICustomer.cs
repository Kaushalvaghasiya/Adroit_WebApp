using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomer
    {
        int Save(Model.Customer customer, string connectionString);
        Model.Customer Get(string email, string connectionString);
        Model.Customer Get(int id, string connectionString);
        List<Model.Customer> List(string connectionString, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
    }
}
