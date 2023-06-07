﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountGroupRepository : ICustomerAccountGroup
    {
        public List<Model.CustomerAccountGroup> GetCustomerAccountGroupList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<Model.CustomerAccountGroup>("sp_CustomerAccountGroupList_Select", connectionString, parameters);
        }
    }
}