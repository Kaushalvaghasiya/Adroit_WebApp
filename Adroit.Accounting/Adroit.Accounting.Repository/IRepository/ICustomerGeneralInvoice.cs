using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerPurchaseGeneralInvoice
    {
        int Save(PurchaseBillMasterViewModel value, string connectionString);
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int loginId, int branchId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<PurchaseBillDetailGridViewModel> GetPurchasebillDetailListByPurchaseBillMasterId(string connectionString, int purchaseBillMasterId, int branchId, int loginId);

        //public CustomerBookViewModel GetListWithIsGeneralPurchaseId(string connectionString, int loginId, int branchId, int firmId);
        //public List<ProductViewModel> CustomerGeneralExpenseMultiSearchProductDescList(string connectionString, string search, int branchId, int firmId);
    }
}