﻿using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRBookingStockRegisterRepository : IReportLRBookingStockRegister
    {
        public List<LRBookingStockRegisterGridViewModel> GetList(LRBookingStockRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchIds", value.BranchIds);
            parameters.Add("@DateFrom", value.DateFrom);
            parameters.Add("@DateTo", value.DateTo);
            parameters.Add("@CityFromIds", value.CityFromIds);
            parameters.Add("@CityToIds", value.CityToIds);
            parameters.Add("@ConsignorIds", value.ConsignorIds);
            parameters.Add("@ConsigneeIds", value.ConsigneeIds);
            parameters.Add("@BillPartyIds", value.BillPartyIds);
            parameters.Add("@PayTypeIds", value.PayTypeIds);
            parameters.Add("@ChalanId", value.ChalanId);
            parameters.Add("@LRStatusId", value.LRStatusId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingStockRegisterGridViewModel>("sp_ReportLRBookingStockRegisterList", connectionString, parameters);
        }

        public List<LRBookingStockRegisterGridViewModel> GetListWithSummary(LRBookingStockRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchIds", value.BranchIds);
            parameters.Add("@DateFrom", value.DateFrom);
            parameters.Add("@DateTo", value.DateTo);
            parameters.Add("@CityFromIds", value.CityFromIds);
            parameters.Add("@CityToIds", value.CityToIds);
            parameters.Add("@ConsignorIds", value.ConsignorIds);
            parameters.Add("@ConsigneeIds", value.ConsigneeIds);
            parameters.Add("@BillPartyIds", value.BillPartyIds);
            parameters.Add("@PayTypeIds", value.PayTypeIds);
            parameters.Add("@ChalanId", value.ChalanId);
            parameters.Add("@LRStatusId", value.LRStatusId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingStockRegisterGridViewModel>("sp_ReportLRBookingStockRegisterListWithSummary", connectionString, parameters);
        }
    }
}
