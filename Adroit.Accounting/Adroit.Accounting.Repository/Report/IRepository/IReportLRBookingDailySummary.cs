﻿using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository
{
    public interface IReportLRBookingDailySummary
    {
        public List<LRBookingDailySummaryGridViewModel> SelectList(LRBookingDailySummaryViewModel model, string connectionString, int loginId, int branchId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}
