using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerGeneralInvoiceRepository : ICustomerGeneralInvoice
    {
        public int Save(PurchaseBillMasterViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@Id", value.Id);
            parameters.Add("@PurBillNo", value.PurchaseBillNumber);
            parameters.Add("@BillDate", value.BillDate);
            parameters.Add("@CityIdTo", value.CityIdTo);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@TransportGSTNumber", value.TransportGSTNumber);
            parameters.Add("@TransportLRNumber", value.TransportLRNumber);
            parameters.Add("@TransportLRDate", value.TransportLRDate);
            parameters.Add("@TransportName", value.TransportName);
            parameters.Add("@TransportMode", value.TransportMode);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@Header1", value.HeaderBox1);
            parameters.Add("@Header2", value.HeaderBox2);
            parameters.Add("@Header3", value.HeaderBox3);
            parameters.Add("@Header4", value.HeaderBox4);
            parameters.Add("@Header5", value.HeaderBox5);
            parameters.Add("@IRNNumber", value.IRNNumber);
            parameters.Add("@BrokerId", value.BrokerBranchMappingId);
            parameters.Add("@AcknowledgementNumber", value.AcknowledgementNumber);
            parameters.Add("@IRNDate", value.IRNDate);
            parameters.Add("@Notes", value.Remarks);
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
            parameters.Add("@RCMBillNumber", value.RCMBillNumber);
            parameters.Add("@BillTypeID", value.BillTypeID);
            parameters.Add("@EwayBillNumber", value.EwayBillNumber);
            parameters.Add("@EntryTypeName", value.EntryTypeName);
            parameters.Add("@DetailTableDetails", value.DetailTableDetails);
            return QueryHelper.Save("sp_CustomerGeneralInvoiceSave", connectionString, parameters);
        }

        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int loginId, int branchId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<PurchaseBillMasterGridViewModel>("sp_CustomerGeneralInvoiceList", connectionString, parameters);
        }
        public List<PurchaseBillDetailGridViewModel> GetPurchasebillDetailListByPurchaseBillMasterId(string connectionString, int purchaseBillMasterId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@PurchaseBillMasterId", purchaseBillMasterId);
            return QueryHelper.GetList<PurchaseBillDetailGridViewModel>("sp_ChalanGetPurchaseBillDetailTableListByPurchaseBillMasterId", connectionString, parameters);
        }
        //public CustomerBookViewModel GetListWithIsGeneralPurchaseId(string connectionString, int loginId, int branchId, int firmId)
        //{
        //    var parameters = new DynamicParameters();
        //    parameters.Add("@LoginId", loginId);
        //    parameters.Add("@BranchId", branchId);
        //    parameters.Add("@FirmId", firmId);
        //    return QueryHelper.Get<CustomerBookViewModel>("sp_GetListWithIsGeneralPurchaseId", connectionString, parameters);
        //}
        //public List<ProductViewModel> CustomerGeneralExpenseMultiSearchProductDescList(string connectionString, string search, int branchId, int firmId)
        //{
        //    var parameters = new DynamicParameters();
        //    parameters.Add("@Search", search);
        //    parameters.Add("@BranchId", branchId);
        //    parameters.Add("@FirmId", firmId);
        //    return QueryHelper.GetList<ProductViewModel>("sp_CustomerGeneralExpensesMultiGetProductGroupListBySearch", connectionString, parameters);
        //}
    }
}
