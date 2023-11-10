using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTUQCRepository : IGSTUQC
    {
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_GSTUQCList_Select", connectionString, parameters);
        }
        public int Save(GSTUQC value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@Code", value.Code);
            parameters.Add("@CodeEWayBill", value.CodeEWayBill);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_GSTUQCSave", connectionString, parameters);
        }
    }
}
