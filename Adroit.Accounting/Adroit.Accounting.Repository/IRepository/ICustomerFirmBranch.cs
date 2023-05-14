using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranch
    {
        int Save(Model.CustomerFirmBranch customerFirmBranch, string connectionString);

        Model.CustomerFirmBranch Get(int id, string connectionString);

        List<Model.CustomerFirmBranch> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");

        void Delete(int id, int deletedById, string connectionString);
    }
}