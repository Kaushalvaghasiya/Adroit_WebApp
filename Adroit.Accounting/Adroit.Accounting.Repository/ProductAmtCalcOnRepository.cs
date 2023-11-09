using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductAmtCalcOnRepository : IProductAmtCalcOn
    {
        public int Save(ProductAmtCalcOn productAmtCalc, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", productAmtCalc.Id);
            parameters.Add("@Title", productAmtCalc.Title);
            parameters.Add("@SoftwareId", productAmtCalc.SoftwareId);
            parameters.Add("@OrderNumber", productAmtCalc.OrderNumber);
            parameters.Add("@Active", productAmtCalc.Active);
            return QueryHelper.Save("sp_ProductAmtCalcOnSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_ProductAmtCalcOnDelete", connectionString, parameters);
        }

        public ProductAmtCalcOnViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<ProductAmtCalcOnViewModel>("sp_ProductAmtCalcOnGet", connectionString, parameters);
        }

        public List<ProductAmtCalcOnGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductAmtCalcOnGridViewModel>("sp_ProductAmtCalcOnList", connectionString, param);
        }

        public List<DropdownViewModel> SelectList(int softwareId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@softwareId", softwareId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ProductAmtCalcOnList_Select", connectionString, parameters);
        }
    }
}
