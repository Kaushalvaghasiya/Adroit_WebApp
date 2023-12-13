using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System.Data;

namespace Adroit.Accounting.Repository
{
    public class CustomerInvoiceRepository : ICustomerInvoice
    {
        public int Save(SalesBillMasterViewModel value, string connectionString, int firmId, int branchId, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@SerialNumberOfBranch", value.SerialNumberOfBranch);
            parameters.Add("@BillDate", value.BillDate);
            parameters.Add("@ChalanDateFrom", value.ChalanDateFrom);
            parameters.Add("@ChalanDateTo", value.ChalanDateTo);
            parameters.Add("@CreditDays", value.CreditDays);
            parameters.Add("@BillNumber", value.BillNumber);
            parameters.Add("@Notes", value.Notes);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@TDSPercentage", value.TDSPercentage);
            parameters.Add("@TCSPercentage", value.TCSPercentage);
            parameters.Add("@TaxableAmount", value.TaxableAmount);
            parameters.Add("@TDSAmount", value.TDSAmount);
            parameters.Add("@SGSTTotal", value.SGSTTotal);
            parameters.Add("@CGSTTotal", value.CGSTTotal);
            parameters.Add("@IGSTTotal", value.IGSTTotal);
            parameters.Add("@GSTStateCessTotal", value.GSTStateCessTotal);
            parameters.Add("@GSTCentralCessTotal", value.GSTCentralCessTotal);
            parameters.Add("@RoundOff", value.RoundOff);
            parameters.Add("@BillAmount", value.BillAmount);
            parameters.Add("@TCSAmount", value.TCSAmount);
            parameters.Add("@LRDetailsList", value.LRDetailsArray);
            parameters.Add("@InvoiceMemo", AppConstants.INVOICE_MEMO_CREDIT);

            return QueryHelper.Save("sp_CustomerInvoiceSave", connectionString, parameters);
        }

    public bool Delete(int id, string connectionString, int loginId)
    {
        var parameters = new DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@LoginId", loginId);
        return QueryHelper.Delete("sp_CustomerInvoiceDelete", connectionString, parameters);
    }
    public SalesBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId)
    {
        var parameters = new DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@LoginId", loginId);
        parameters.Add("@BranchId", branchId);
        return QueryHelper.Get<SalesBillMasterViewModel>("sp_CustomerInvoiceGet", connectionString, parameters);
    }
    public List<SalesBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
    {
        var parameters = new DynamicParameters();
        parameters.Add("@BranchId", branchId);
        parameters.Add("@Search", search);
        parameters.Add("@PageStart", pageStart);
        parameters.Add("@PageSize", pageSize);
        parameters.Add("@SortColumn", sortColumn);
        parameters.Add("@SortOrder", sortOrder);
        return QueryHelper.GetList<SalesBillMasterGridViewModel>("sp_CustomerInvoiceList", connectionString, parameters);
    }
}
}
