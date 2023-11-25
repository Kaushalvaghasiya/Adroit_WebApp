using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerBookRepository : ICustomerBook
    {
        public int Save(CustomerBook value, string connectionString, int loginId, int branchId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            parameters.Add("@branchId", branchId);
            parameters.Add("@Id", value.Id);
            parameters.Add("@BookAccountId", value.BookAccountId);
            parameters.Add("@BookTypeId", value.BookTypeId);
            parameters.Add("@BoxLabel1", value.BoxLabel1);
            parameters.Add("@BoxLabel2", value.BoxLabel2);
            parameters.Add("@BoxLabel3", value.BoxLabel3);
            parameters.Add("@BoxLabel4", value.BoxLabel4);
            parameters.Add("@BoxLabel5", value.BoxLabel5);
            parameters.Add("@BoxLabel6", value.BoxLabel6);
            parameters.Add("@BillNoPrefix", value.BillNoPrefix);
            parameters.Add("@BillNoPostFix", value.BillNoPostFix);
            parameters.Add("@LRRequired", value.LRRequired);
            parameters.Add("@BillTypeID", (value.BillTypeID == 0 ? null : value.BillTypeID));
            parameters.Add("@IsGeneralPurchase", value.IsGeneralPurchase);
            parameters.Add("@IsItemDiscount", value.IsItemDiscount);
            parameters.Add("@IsItemDiscountSp", value.IsItemDiscountSp);
            parameters.Add("@IsCashPayAtBill", value.IsCashPayAtBill);
            parameters.Add("@ItemDesc1", value.ItemDesc1);
            parameters.Add("@ItemDesc2", value.ItemDesc2);
            parameters.Add("@ItemDesc3", value.ItemDesc3);
            parameters.Add("@ItemDesc4", value.ItemDesc4);
            parameters.Add("@ItemDesc5", value.ItemDesc5);
            parameters.Add("@ItemDesc6", value.ItemDesc6);
            parameters.Add("@ShowSalesOrderBoxNumber", value.ShowSalesOrderBoxNumber);
            parameters.Add("@ShowPurcahseOrderBoxNumber", value.ShowPurcahseOrderBoxNumber);
            parameters.Add("@ShowQuotationBoxNumber", value.ShowQuotationBoxNumber);
            parameters.Add("@ShowPerformaInvoiceNumber", value.ShowPerformaInvoiceNumber);
            parameters.Add("@SalesBillFrom", value.SalesBillFrom);
            parameters.Add("@IsCalcMultiply", value.IsCalcMultiply);
            parameters.Add("@BookShortName", value.BookShortName);
            parameters.Add("@HeaderBox1", value.HeaderBox1);
            parameters.Add("@HeaderBox2", value.HeaderBox2);
            parameters.Add("@HeaderBox3", value.HeaderBox3);
            parameters.Add("@HeaderBox4", value.HeaderBox4);
            parameters.Add("@HeaderBox5", value.HeaderBox5);
            parameters.Add("@IsTDSAccount", value.IsTDSAccount);
            parameters.Add("@TDSAccountId", (value.TDSAccountId == 0 ? null : value.TDSAccountId));
            parameters.Add("@IsTCSAccount", value.IsTCSAccount);
            parameters.Add("@TCSAccountId", (value.TCSAccountId == 0 ? null : value.TCSAccountId));
            parameters.Add("@SGSTAccountId", value.SGSTAccountId);
            parameters.Add("@CGSTAccountId", value.CGSTAccountId);
            parameters.Add("@IGSTAccountId", value.IGSTAccountId);
            parameters.Add("@GSTStateCessAccountId", (value.GSTStateCessAccountId == 0 ? null : value.GSTStateCessAccountId));
            parameters.Add("@GSTCentralCessAccountId", (value.GSTCentralCessAccountId == 0 ? null : value.GSTCentralCessAccountId));
            parameters.Add("@RCMSGSTPayAccountId", (value.RcmSGSTPayAccountId == 0 ? null : value.RcmSGSTPayAccountId));
            parameters.Add("@RCMCGSTPayAccountId", (value.RcmCGSTPayAccountId == 0 ? null : value.RcmCGSTPayAccountId));
            parameters.Add("@RCMIGSTPayAccountId", (value.RcmIGSTPayAccountId == 0 ? null : value.RcmIGSTPayAccountId));
            parameters.Add("@RCMSGSTRecAccountId", (value.RcmSGSTRecAccountId == 0 ? null : value.RcmSGSTRecAccountId));
            parameters.Add("@RCMCGSTRecAccountId", (value.RcmCGSTRecAccountId == 0 ? null : value.RcmCGSTRecAccountId));
            parameters.Add("@RCMIGSTRecAccountId", (value.RcmIGSTRecAccountId == 0 ? null : value.RcmIGSTRecAccountId));
            parameters.Add("@RoundOffAccountId", value.RoundOffAccountId);
            parameters.Add("@CustomerBookBranchId", value.CustomerBookBranchId);
            parameters.Add("@Active", value.Active);

            return QueryHelper.Save("sp_CustomerBookSave", connectionString, parameters);
        }
        public CustomerBook Get(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.Get<CustomerBook>("sp_CustomerBookGet", connectionString, parameters);
        }
        public List<CustomerBookGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerBookGridViewModel>("sp_CustomerBookList", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.Delete("sp_CustomerBookDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectListByLoginId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerBookBranchMappingList_Select", connectionString, parameters);
        }

    }
}