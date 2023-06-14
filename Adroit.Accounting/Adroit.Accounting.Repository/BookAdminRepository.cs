using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository
{
    public class BookAdminRepository : IBookAdmin
    {
        public int Save(BookAdmin bookAdmin, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", bookAdmin.Id);
            parameters.Add("@BookAccountId", bookAdmin.BookAccountId);
            parameters.Add("@BookTypeId", bookAdmin.BookTypeId);
            parameters.Add("@BoxLabel1", bookAdmin.BoxLabel1);
            parameters.Add("@BoxLabel2", bookAdmin.BoxLabel2);
            parameters.Add("@BoxLabel3", bookAdmin.BoxLabel3);
            parameters.Add("@BoxLabel4", bookAdmin.BoxLabel4);
            parameters.Add("@BoxLabel5", bookAdmin.BoxLabel5);
            parameters.Add("@BoxLabel6", bookAdmin.BoxLabel6);
            parameters.Add("@BillNoPrefix", bookAdmin.BillNoPrefix);
            parameters.Add("@BillNoPostFix", bookAdmin.BillNoPostFix);
            parameters.Add("@LRRequired", bookAdmin.LRRequired);
            parameters.Add("@BillTypeID", bookAdmin.BillTypeID);
            parameters.Add("@IsGeneralPurchase", bookAdmin.IsGeneralPurchase);
            parameters.Add("@IsItemDiscount", bookAdmin.IsItemDiscount);
            parameters.Add("@IsItemDiscountSp", bookAdmin.IsItemDiscountSp);
            parameters.Add("@IsCashPayAtBill", bookAdmin.IsCashPayAtBill);
            parameters.Add("@ItemDesc1", bookAdmin.ItemDesc1);
            parameters.Add("@ItemDesc2", bookAdmin.ItemDesc2);
            parameters.Add("@ItemDesc3", bookAdmin.ItemDesc3);
            parameters.Add("@ItemDesc4", bookAdmin.ItemDesc4);
            parameters.Add("@ItemDesc5", bookAdmin.ItemDesc5);
            parameters.Add("@ItemDesc6", bookAdmin.ItemDesc6);
            parameters.Add("@ShowSalesOrderBoxNumber", bookAdmin.ShowSalesOrderBoxNumber);
            parameters.Add("@ShowPurcahseOrderBoxNumber", bookAdmin.ShowPurcahseOrderBoxNumber);
            parameters.Add("@ShowQuotationBoxNumber", bookAdmin.ShowQuotationBoxNumber);
            parameters.Add("@ShowPerformaInvoiceNumber", bookAdmin.ShowPerformaInvoiceNumber);
            parameters.Add("@SalesBillFrom", bookAdmin.SalesBillFrom);
            parameters.Add("@IsCalcMultiply", bookAdmin.IsCalcMultiply);
            parameters.Add("@BookShortName", bookAdmin.BookShortName);
            parameters.Add("@HeaderBox1", bookAdmin.HeaderBox1);
            parameters.Add("@HeaderBox2", bookAdmin.HeaderBox2);
            parameters.Add("@HeaderBox3", bookAdmin.HeaderBox3);
            parameters.Add("@HeaderBox4", bookAdmin.HeaderBox4);
            parameters.Add("@HeaderBox5", bookAdmin.HeaderBox5);
            parameters.Add("@IsTDSAccount", bookAdmin.IsTDSAccount);
            parameters.Add("@TDSAccountId", bookAdmin.TDSAccountId);
            parameters.Add("@IsTCSAccount", bookAdmin.IsTCSAccount);
            parameters.Add("@TCSAccountId", bookAdmin.TCSAccountId);
            parameters.Add("@SGSTAccountId", bookAdmin.SGSTAccountId);
            parameters.Add("@CGSTAccountId", bookAdmin.CGSTAccountId);
            parameters.Add("@IGSTAccountId", bookAdmin.IGSTAccountId);
            parameters.Add("@GSTStateCessAccountId", bookAdmin.GSTStateCessAccountId);
            parameters.Add("@GSTCentralCessAccountId", bookAdmin.GSTCentralCessAccountId);
            parameters.Add("@RCMSGSTPayAccountId", bookAdmin.RCMSGSTPayAccountId);
            parameters.Add("@RCMCGSTPayAccountId", bookAdmin.RCMCGSTPayAccountId);
            parameters.Add("@RCMIGSTPayAccountId", bookAdmin.RCMIGSTPayAccountId);
            parameters.Add("@RCMSGSTRecAccountId", bookAdmin.RCMSGSTRecAccountId);
            parameters.Add("@RCMCGSTRecAccountId", bookAdmin.RCMCGSTRecAccountId);
            parameters.Add("@RCMIGSTRecAccountId", bookAdmin.RCMIGSTRecAccountId);
            parameters.Add("@RoundOffAccountId", bookAdmin.RoundOffAccountId);
            parameters.Add("@IsDeleted", bookAdmin.IsDeleted);
            parameters.Add("@IsActive", bookAdmin.IsActive);

            return QueryHelper.Save("sp_BookAdminSave", connectionString, parameters);
        }
        public BookAdmin Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<BookAdmin>("sp_BookAdminGet", connectionString, parameters);
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