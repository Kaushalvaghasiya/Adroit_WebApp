using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomer
    {
        int Save(Customer customer, string connectionString);
        int Register(Customer customer, string connectionString);
        Customer Get(string email, string connectionString);
        Customer Get(int id, string connectionString);
        List<Customer> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
        List<Customer> GetCustomerList(string connectionString);
    }
}