﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTRateRepository : IGSTRate
    {
        public int Save(GSTRate value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Rate", value.Rate);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_GSTRateSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_GSTRateDelete", connectionString, parameters);
        }

        public GSTRateViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<GSTRateViewModel>("sp_GSTRateGet", connectionString, parameters);
        }

        public List<GSTRateGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<GSTRateGridViewModel>("sp_GSTRateList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_GSTRateList_Select", connectionString, parameters);
        }
        public GSTRateViewModel GetListWithProductId(string connectionString, int productId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ProductId", productId);
            return QueryHelper.Get<GSTRateGridViewModel>("sp_GetGSTRateListWithProductId", connectionString, parameters);
        }

    }
}
