﻿using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBusiness
    {
        List<Model.Business> GetBusinessList(string connectionString);
    }
}