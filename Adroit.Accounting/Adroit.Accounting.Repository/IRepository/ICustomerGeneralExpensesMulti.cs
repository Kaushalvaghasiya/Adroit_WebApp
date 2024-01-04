using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerGeneralExpensesMulti
    {
        public PurchaseBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public CustomerBookViewModel GetListWithIsGeneralPurchaseId(string connectionString, int loginId, int branchId, int firmId);
        public ProductViewModel CustomerGeneralExpenseMultiSearchProductDescList(string connectionString, string search, int branchId, int firmId);
    }
}