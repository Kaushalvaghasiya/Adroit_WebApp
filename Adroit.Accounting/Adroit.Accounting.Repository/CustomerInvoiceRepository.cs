using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System.Data;
using System.Text.Json;

namespace Adroit.Accounting.Repository
{
    public class CustomerInvoiceRepository : ICustomerInvoice
    {
        public int Save(SalesBillMasterViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@YearId", value.YearId);

            parameters.Add("@Id", value.Id);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@BillDate", value.BillDate);
            parameters.Add("@SerialNumberOfBranch", value.SerialNumberOfBranch);
            parameters.Add("@InvoiceMemo", value.InvoiceMemo);
            parameters.Add("@SalesBillFromName", value.SalesBillFromName);
            parameters.Add("@EntryTypeName", value.EntryTypeName);
            parameters.Add("@ChalanDateFrom", value.ChalanDateFrom);
            parameters.Add("@ChalanDateTo", value.ChalanDateTo);
            parameters.Add("@ChalanNo", value.ChalanNo);
            parameters.Add("@SalesOrderNumber", value.SalesOrderNumber);
            parameters.Add("@BillTypeId", value.BillTypeID);
            parameters.Add("@DeliveryPartyAccountBranchMappingId", value.DeliveryPartyAccountBranchMappingId);
            parameters.Add("@ShippingAccountBranchMappingId", value.ShippingAccountBranchMappingId);
            parameters.Add("@HastePartyAccountBranchMappingId", value.HastePartyAccountBranchMappingId);
            parameters.Add("@DeliveryLRBookingId", value.DeliveryLRBookingId);
            parameters.Add("@SalesPartyName1", value.SalesPartyName1);
            parameters.Add("@SalesPartyName2", value.SalesPartyName2);
            parameters.Add("@CreditDays", value.CreditDays);
            parameters.Add("@TaxableAmount", value.TaxableAmount);
            parameters.Add("@SGSTTotal", value.SGSTTotal);
            parameters.Add("@CGSTTotal", value.CGSTTotal);
            parameters.Add("@IGSTTotal", value.IGSTTotal);
            parameters.Add("@GSTStateCessTotal", value.GSTStateCessTotal);
            parameters.Add("@GSTCentralCessTotal", value.GSTCentralCessTotal);
            parameters.Add("@TCSPercentage", value.TCSPercentage);
            parameters.Add("@TCSAmount", value.TCSAmount);
            parameters.Add("@TDSPercentage", value.TDSPercentage);
            parameters.Add("@TDSAmount", value.TDSAmount);
            parameters.Add("@ExtraAmount", value.ExtraAmount);
            parameters.Add("@RoundOff", value.RoundOff);
            parameters.Add("@BillAmount", value.BillAmount);
            parameters.Add("@BrokerBranchMappingId", value.BrokerBranchMappingId);
            parameters.Add("@Notes", value.Notes);
            parameters.Add("@EwayBillNumber", value.EwayBillNumber);
            parameters.Add("@IRNNumber", value.IRNNumber);
            parameters.Add("@AcknowledgementNumber", value.AcknowledgementNumber);
            parameters.Add("@IRNDate", value.IRNDate);
            parameters.Add("@ReturnBillNumber", value.ReturnBillNumber);
            parameters.Add("@ReturnBillDate", value.ReturnBillDate);
            parameters.Add("@ReturnReasonId", value.ReturnReasonId);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@TransportGSTNumber", value.TransportGSTNumber);
            parameters.Add("@TransportLRNumber", value.TransportLRNumber);
            parameters.Add("@TransportLRDate", value.TransportLRDate);
            parameters.Add("@TransportName", value.TransportName);
            parameters.Add("@TransportModeId", value.TransportModeId);
            parameters.Add("@ToStationCityId", value.ToStationCityId);
            parameters.Add("@HeaderBox1", value.HeaderBox1);
            parameters.Add("@HeaderBox2", value.HeaderBox2);
            parameters.Add("@HeaderBox3", value.HeaderBox3);
            parameters.Add("@HeaderBox4", value.HeaderBox4);
            parameters.Add("@HeaderBox5", value.HeaderBox5);
            parameters.Add("@PaidAmount", value.PaidAmount);
            parameters.Add("@UnPaidAmount", value.UnPaidAmount);
            parameters.Add("@CreditNoteId", value.CreditNoteId);
            parameters.Add("@BillNumber", value.BillNumber);
            parameters.Add("@Prefix", value.Prefix);
            parameters.Add("@Postfix", value.Postfix);

            parameters.Add("@LRDetailsJson", JsonSerializer.Serialize(value.LRDetailsArray));

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
        public List<SalesBillMasterGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SalesBillMasterGridViewModel>("sp_CustomerInvoiceList", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetListByLRNumberId(string connectionString, int LRNumberId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LRNumberId", LRNumberId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_InvoiceLRBookingGetGridDetailsByLRNumber", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountBranchMappingList_Select(int loginId, int firmId, int branchId, int payTypeId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@PayTypeId", payTypeId);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_InvoiceCustomerAccounListWithGroup_Select", connectionString, parameters);
        }
        public List<SalesBillMasterViewModel> SelectList(string connectionString, int loginId, int firmId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<SalesBillMasterViewModel>("sp_ReceiveInvoiceList", connectionString, parameters);
        }
    }
}
