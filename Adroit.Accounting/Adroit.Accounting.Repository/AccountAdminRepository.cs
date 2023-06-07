﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AccountAdminRepository : IAccountAdmin
    {
        public List<Model.AccountAdmin> GetAccountAdminList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<Model.AccountAdmin>("sp_AccountAdminList_Select", connectionString, parameters);
        }
    }
}