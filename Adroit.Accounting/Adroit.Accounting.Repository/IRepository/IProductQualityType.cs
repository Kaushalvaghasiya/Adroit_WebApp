﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProductQualityType
    {
        List<ProductQualityTypeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(ProductQualityType value, string connectionString);
        ProductQualityTypeViewModel Get(int id, string connectionString);
    }
}
