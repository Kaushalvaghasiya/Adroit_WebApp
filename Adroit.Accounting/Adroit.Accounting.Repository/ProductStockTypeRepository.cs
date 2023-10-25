﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductStockTypeRepository : IProductStockType
    {
        public int Save(ProductStockType productStockType, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", productStockType.Id);
            parameters.Add("@Title", productStockType.Title);
            parameters.Add("@OrderNumber", productStockType.OrderNumber);
            parameters.Add("@Active", productStockType.Active);
            return QueryHelper.Save("sp_ProductStockTypeSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_ProductStockTypeDelete", connectionString, parameters);
        }

        public ProductStockTypeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<ProductStockTypeViewModel>("sp_ProductStockTypeGet", connectionString, parameters);
        }

        public List<ProductStockTypeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ProductStockTypeGridViewModel>("sp_ProductStockTypeList", connectionString, param);
        }

    }
}