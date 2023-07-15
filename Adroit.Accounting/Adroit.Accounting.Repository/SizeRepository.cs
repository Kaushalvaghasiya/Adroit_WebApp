using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class SizeRepository : ISize
    {
        public int Save(ProductSizeAdmin productSizeAdmin, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", productSizeAdmin.Id);
            parameters.Add("@Title", productSizeAdmin.Title);
            parameters.Add("@OrderNumber", productSizeAdmin.OrderNumber);
            parameters.Add("@Active", productSizeAdmin.Active);
            return QueryHelper.Save("sp_SizeSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_SizeDelete", connectionString, parameters);
        }
        public SizeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<SizeViewModel>("sp_SizeGet", connectionString, parameters);
        }
        public List<SizeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SizeGridViewModel>("sp_SizeList", connectionString, param);
        }
    }
}
