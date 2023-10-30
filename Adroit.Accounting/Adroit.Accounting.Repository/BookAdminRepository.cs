using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class BookAdminRepository : IBookAdmin
    {
        public int Save(BookAdmin value, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
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
            parameters.Add("@RCMSGSTPayAccountId", (value.RCMSGSTPayAccountId == 0 ? null : value.RCMSGSTPayAccountId));
            parameters.Add("@RCMCGSTPayAccountId", (value.RCMCGSTPayAccountId == 0 ? null : value.RCMCGSTPayAccountId));
            parameters.Add("@RCMIGSTPayAccountId", (value.RCMIGSTPayAccountId == 0 ? null : value.RCMIGSTPayAccountId));
            parameters.Add("@RCMSGSTRecAccountId", (value.RCMSGSTRecAccountId == 0 ? null : value.RCMSGSTRecAccountId));
            parameters.Add("@RCMCGSTRecAccountId", (value.RCMCGSTRecAccountId == 0 ? null : value.RCMCGSTRecAccountId));
            parameters.Add("@RCMIGSTRecAccountId", (value.RCMIGSTRecAccountId == 0 ? null : value.RCMIGSTRecAccountId));
            parameters.Add("@RoundOffAccountId", value.RoundOffAccountId);
            parameters.Add("@Active", value.Active);

            return QueryHelper.Save("sp_BookAdminSave", connectionString, parameters);
        }
        public BookAdmin Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.Get<BookAdmin>("sp_BookAdminGet", connectionString, parameters);
        }
        public List<BookAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<BookAdminGridViewModel>("sp_BookAdminList", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.Delete("sp_BookAdminDelete", connectionString, parameters);
        }
        public List<BookAdmin> GetBookAdminSelectList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<BookAdmin>("sp_BookAdminList_Select", connectionString, parameters);
        }
    }
}