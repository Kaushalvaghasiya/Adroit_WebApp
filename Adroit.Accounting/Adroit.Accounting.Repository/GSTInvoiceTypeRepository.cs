using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTInvoiceTypeRepository : IGSTInvoiceType
    {
        public GSTInvoiceTypeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<GSTInvoiceTypeViewModel>("sp_GSTInvoiceTypeGet", connectionString, parameters);
        }

        public List<GSTInvoiceTypeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<GSTInvoiceTypeGridViewModel>("sp_GSTInvoiceTypeList", connectionString, param);
        }

        public int Save(GSTInvoiceType gstInvoiceType, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", gstInvoiceType.Id);
            parameters.Add("@Title", gstInvoiceType.Title);
            parameters.Add("@TitleB2B", gstInvoiceType.TitleB2B);
            parameters.Add("@TitleEinvoice", gstInvoiceType.TitleEinvoice);
            parameters.Add("@TitleCDNUR", gstInvoiceType.TitleCDNUR);
            parameters.Add("@PayType", gstInvoiceType.PayType);
            parameters.Add("@OrderNumber", gstInvoiceType.OrderNumber);
            parameters.Add("@Active", gstInvoiceType.Active);
            return QueryHelper.Save("sp_GSTInvoiceTypeSave", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_GSTInvoiceTypeList_Select", connectionString, parameters);
        }
    }
}
