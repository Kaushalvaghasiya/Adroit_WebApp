﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ProductSizeRepository : IProductSize
    {
        public int Save(ProductSize value, int userId,string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@UserId", userId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_ProductSizeSave", connectionString, parameters);
        }
        public ProductSizeViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<ProductSizeViewModel>("sp_ProductSizeGet", connectionString, parameters);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_ProductSizeDelete", connectionString, parameters);
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
        public List<DropdownViewModel> SelectList(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ProductSizeList_Select", connectionString, parameters);
        }
    }
}
