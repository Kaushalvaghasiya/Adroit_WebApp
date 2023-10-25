﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTPortRepository : IGSTPort
    {
        public int Save(GSTPort value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@Code", value.Code);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_GSTPortSave", connectionString, parameters);
        }
        public GSTPortViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<GSTPortViewModel>("sp_GSTPortGet", connectionString, parameters);
        }
        public List<GSTPortGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<GSTPortGridViewModel>("sp_GSTPortList", connectionString, param);
        }
    }
}