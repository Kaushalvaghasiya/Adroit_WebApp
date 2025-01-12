﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmTransportSetting
    {
        List<CustomerFirmTransportSettingGridViewModel> List(string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(CustomerFirmTransportSetting value, string connectionString, int loginId);
        CustomerFirmTransportSettingViewModel Get(int id, string connectionString);
    }
}
