using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTCalculationRepository : IGSTCalculation
    {
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_GSTCalculationList_Select", connectionString, parameters);
        }

        public int Save(GSTCalculation gstCalculation, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", gstCalculation.Id);
            parameters.Add("@Title", gstCalculation.Title);
            parameters.Add("@OrderNumber", gstCalculation.OrderNumber);
            parameters.Add("@Active", gstCalculation.Active);
            return QueryHelper.Save("sp_GSTCalculationSave", connectionString, parameters);
        }
    }
}
