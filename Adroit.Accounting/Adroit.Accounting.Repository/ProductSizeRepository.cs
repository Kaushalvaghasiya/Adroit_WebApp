using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductSizeRepository : IProductSize
    {
        public int Save(ProductSizeAdmin productSizeAdmin, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", productSizeAdmin.Id);
            parameters.Add("@Title", productSizeAdmin.Title);
            parameters.Add("@OrderNumber", productSizeAdmin.OrderNumber);
            parameters.Add("@Active", productSizeAdmin.Active);
            return QueryHelper.Save("sp_ProductSizeSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_ProductSizeDelete", connectionString, parameters);
        }
        public ProductSizeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<ProductSizeViewModel>("sp_ProductSizeGet", connectionString, parameters);
        }
        public List<ProductSizeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductSizeGridViewModel>("sp_ProductSizeList", connectionString, param);
        }
    }
}
