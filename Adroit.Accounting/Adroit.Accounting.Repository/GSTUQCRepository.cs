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
        public byte Save(GSTUQC gstUQC, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", gstUQC.Id);
            parameters.Add("@Title", gstUQC.Title);
            parameters.Add("@Code", gstUQC.Code);
            parameters.Add("@CodeEWayBill", gstUQC.CodeEWayBill);
            parameters.Add("@OrderNumber", gstUQC.OrderNumber);
            parameters.Add("@Active", gstUQC.Active);
            return (byte)QueryHelper.Save("sp_GSTUQCSave", connectionString, parameters);
        }
    }
}
