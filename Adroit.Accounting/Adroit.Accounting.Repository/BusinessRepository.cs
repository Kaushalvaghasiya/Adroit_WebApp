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
    public class BusinessRepository:IBusiness
    {
        public List<Model.Business> GetBusinessList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.Business>("sp_BusinessList_Select", connectionString, parameters);
        }
    }
}