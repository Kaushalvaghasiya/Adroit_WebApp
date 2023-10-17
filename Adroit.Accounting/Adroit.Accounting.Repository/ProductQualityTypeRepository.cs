using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductQualityTypeRepository : IProductQualityType
    {
        public int Save(ProductQualityType productQualityType, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", productQualityType.Id);
            parameters.Add("@Title", productQualityType.Title);
            parameters.Add("@OrderNumber", productQualityType.OrderNumber);
            parameters.Add("@Active", productQualityType.Active);
            return QueryHelper.Save("sp_ProductQualityTypeSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_ProductQualityTypeDelete", connectionString, parameters);
        }

        public ProductQualityTypeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<ProductQualityTypeViewModel>("sp_ProductQualityTypeGet", connectionString, parameters);
        }

        public List<ProductQualityTypeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductQualityTypeGridViewModel>("sp_ProductQualityTypeList", connectionString, param);
        }

    }
}
