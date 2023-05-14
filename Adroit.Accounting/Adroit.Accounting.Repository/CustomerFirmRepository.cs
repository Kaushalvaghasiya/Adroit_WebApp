using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmRepository : ICustomerFirm
    {
        public void Delete(int id, int deletedById, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@DeletedBy", deletedById);
            QueryHelper.Save("sp_CustomerFirmDelete", connectionString, parameters);
        }

        public CustomerFirm Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<Model.CustomerFirm>("sp_CustomerFirmGet", connectionString, parameters);
        }

        public List<CustomerFirm> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder, int CustomerId)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            param.Add("@CustomerId", CustomerId);
            
            return QueryHelper.GetList<Model.CustomerFirm>("sp_CustomerFirmList", connectionString, param);
        }

        public int Save(CustomerFirm customerFirm, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", customerFirm.Id);
            parameters.Add("@CustomerId", customerFirm.CustomerId);
            parameters.Add("@BusinessId", $"{(short)customerFirm.BusinessId}");
            parameters.Add("@Title", customerFirm.Title);
            parameters.Add("@OwnerName ", customerFirm.OwnerName);
            parameters.Add("@TAN ", customerFirm.TAN ?? "");
            parameters.Add("@IECCode ", customerFirm.IECCode ?? "");
            parameters.Add("@IsLutBond ", customerFirm.IsLutBond);
            parameters.Add("@LutBondNumber", customerFirm.LutBondNumber ?? "");
            parameters.Add("@IsGTA ", customerFirm.IsGTA);
            parameters.Add("@FirmTypeId ", customerFirm.FirmTypeId);
            parameters.Add("@GstFirmTypeId ", customerFirm.GstFirmTypeId);
            parameters.Add("@SoftwareId ", customerFirm.SoftwareId);
            parameters.Add("@BranchLimit ", $"{(short)customerFirm.BranchLimit}");
            parameters.Add("@IsDeleted ", customerFirm.IsDeleted);
            parameters.Add("@IsActive ", customerFirm.IsActive);
            parameters.Add("@ModifiedById", customerFirm.ModifiedById);
            parameters.Add("@OrderNumber ", customerFirm.OrderNumber);
            parameters.Add("@AddedById ", customerFirm.AddedById);
            parameters.Add("@AdharUID", customerFirm.AdharUID);
            parameters.Add("@LRResetOnYearEnd", customerFirm.LRResetOnYearEnd);
            parameters.Add("@CessRequired", customerFirm.CessRequired);

            return QueryHelper.Save("sp_CustomerFirmSave", connectionString, parameters);
        }
    }
}