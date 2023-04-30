using Adroit.Accounting.Model;
using Adroit.Accounting.SQL;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccount
    {
        public int Save(Model.CustomerAccount customerAccount, string connectionString, int loginId = 0, int firmId = 0);
        public Model.CustomerAccount Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<Model.CustomerAccount> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<Model.CustomerAccount> GetCustomerAccountList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
