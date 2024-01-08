using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductRepository : IProduct
    {
        public List<DropdownViewModel> GetProductList(int firmId, string connectionString, int loginId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ProductList_Select", connectionString, parameters);
        }

        public int Save(ProductViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", value.loginId);
            parameters.Add("@FirmId", value.firmId);
            parameters.Add("@SoftwareId", value.softwareId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@Code", value.Code);
            parameters.Add("@PrintName", value.PrintName);
            parameters.Add("@TitleAlternate", value.TitleAlternate);
            parameters.Add("@DesignNumber", value.ProductDesignNumber);
            parameters.Add("@Colour", value.ColorName);
            parameters.Add("@Size", value.SizeName);
            parameters.Add("@Packing", value.PackingName);
            parameters.Add("@ShadeNumber", value.ShadeNumber);
            parameters.Add("@Fabric", value.FabricName);
            parameters.Add("@Group", value.GroupName);
            parameters.Add("@SubGroup", value.SubGroupName);
            parameters.Add("@StockType", value.StockTypeName);
            parameters.Add("@QualityType", value.QualityTypeName);
            parameters.Add("@UQCId", value.UQCId);
            parameters.Add("@UQC", value.UQCTypeName);
            parameters.Add("@HSNCode", value.HSNCode);
            parameters.Add("@Category", value.CategoryName);
            parameters.Add("@DenierWeight", value.DenierWeight);
            parameters.Add("@RatePerMeter", value.RatePerMeter);
            parameters.Add("@RateRetail", value.RateRetail);
            parameters.Add("@Mrp", value.Mrp);
            parameters.Add("@DistributorRate", value.DistributorRate);
            parameters.Add("@DealerRate", value.DealerRate);
            parameters.Add("@PurchaseRate", value.PurchaseRate);
            parameters.Add("@Cut", value.Cut);
            parameters.Add("@AveragePack", value.AveragePack);
            parameters.Add("@BoxPack", value.BoxPack);
            parameters.Add("@RolMin", value.RolMin);
            parameters.Add("@RolMax", value.RolMax);
            parameters.Add("@GSTCalculation", value.GSTCalculationName);
            parameters.Add("@GSTRate", value.GSTRateName);
            parameters.Add("@GstCentralCess", value.GstCentralCess);
            parameters.Add("@GstStateCess", value.GstStateCess);
            parameters.Add("@AmountCalc", value.AmtCalcName);
            parameters.Add("@RateUpdate", value.RateUpdate);
            parameters.Add("@Discount", value.Discount);
            parameters.Add("@HSNDesc", value.HSNDesc);
            parameters.Add("@Remarks1", value.Remarks1);
            parameters.Add("@Remarks2", value.Remarks2);
            parameters.Add("@Active", value.Active);
            parameters.Add("@ProductBranchId", value.ProductBranchId);
            return QueryHelper.Save("sp_ProductSave", connectionString, parameters);
        }
        public void Delete(int id, int firmId, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            QueryHelper.Save("sp_ProductDelete", connectionString, parameters);
        }

        public ProductViewModel Get(int id, string connectionString, int loginId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<ProductViewModel>("sp_ProductGet", connectionString, parameters);
        }

        public List<ProductGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductGridViewModel>("sp_ProductList", connectionString, param);
        }
    }
}
