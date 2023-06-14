﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirm
    {
        int Save(CustomerFirm customerFirm, string connectionString);

        CustomerFirm Get(int id, string connectionString);

        List<CustomerFirmGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId=0);

        void Delete(int id, int deletedById, string connectionString);
    }
}