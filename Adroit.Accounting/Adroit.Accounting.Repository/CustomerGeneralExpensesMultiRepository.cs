using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerGeneralExpensesMultiRepository : ICustomerGeneralExpensesMulti
    {
        public int Save(PurchaseBillMasterViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@Id", value.Id);
            parameters.Add("@BillNumberBranch", value.BillNumberBranch);
            parameters.Add("@BillNumberFirm", value.BillNumberFirm);
            parameters.Add("@BillDate", value.BillDate);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@EwayBillNumber", value.EwayBillNumber);
            parameters.Add("@Notes", value.Notes);
            parameters.Add("@TaxableAmount", value.TaxableAmount);
            parameters.Add("@TDSAmount", value.TDSAmount);
            parameters.Add("@TDSPercent", value.TDSPercent);
            parameters.Add("@SGSTTotal", value.SGSTTotal);
            parameters.Add("@CGSTTotal", value.CGSTTotal);
            parameters.Add("@IGSTTotal", value.IGSTTotal);
            parameters.Add("@GSTStateCessTotal", value.GSTStateCessTotal);
            parameters.Add("@GSTCentralCessTotal", value.GSTCentralCessTotal);
            parameters.Add("@TCSPercent", value.TCSPercent);
            parameters.Add("@TCSAmount", value.TCSAmount);
            parameters.Add("@CreditDays", value.CreditDays);
            parameters.Add("@RoundOff", value.RoundOff);
            parameters.Add("@BillAmount", value.BillAmount);
            parameters.Add("@GenaralPurchaseAccountBranchMappingId", value.GenaralPurchaseAccountBranchMappingId);
            parameters.Add("@SkipInGSTR", value.SkipInGSTR);
            parameters.Add("@RCMBillNumber", value.RCMBillNumber);
            parameters.Add("@BillTypeID", value.BillTypeID);
            parameters.Add("@EntryTypeName", value.EntryTypeName);
            parameters.Add("@DetailTableDetails", value.DetailTableDetails);
            return QueryHelper.Save("sp_CustomerGeneralExpensesMultiSave", connectionString, parameters);
        }

        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<PurchaseBillMasterGridViewModel>("sp_CustomerGeneralExpensesMultiList", connectionString, parameters);
        }

        public CustomerBookViewModel GetListWithIsGeneralPurchaseId(string connectionString, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<CustomerBookViewModel>("sp_GetListWithIsGeneralPurchaseId", connectionString, parameters);
        }
        public List<ProductViewModel> CustomerGeneralExpenseMultiSearchProductDescList(string connectionString, string search, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Search", search);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<ProductViewModel>("sp_CustomerGeneralExpensesMultiGetProductGroupListBySearch", connectionString, parameters);
        }
    }
}
