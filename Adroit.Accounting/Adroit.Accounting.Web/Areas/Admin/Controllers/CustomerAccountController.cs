using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Options;
using System.Data;

namespace Adroit.Accounting.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CustomerAccountController : Controller
    {
        private ICustomerAccountRepository _customerAccountRepo;        
        private ICustomerBrokerBranchMappingRepository _customerBrokerBranchMappingRepo;        
        private ICustomerAccountGroupRepository _customerAccountGroupRepo;
        private readonly ConfigurationData _configurationData;        
        private readonly EmailSetup _emailData;
        public CustomerAccountController(ICustomerAccountRepository customerAccountRepo, IStateRepository stateRepo,
                IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData,
                ICustomerBrokerBranchMappingRepository customerBrokerBranchMappingRepo,ICustomerAccountGroupRepository customerAccountGroupRepo)
        {
            _customerAccountRepo = customerAccountRepo;
            _configurationData = configurationData.Value;
            _emailData = emailData.Value;
            _customerBrokerBranchMappingRepo = customerBrokerBranchMappingRepo;
            _customerAccountGroupRepo = customerAccountGroupRepo;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveDetail(CustomerAccount model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerAccountRepo.Save(model, _configurationData.DatabaseConnectionString);
                if (id > 0)
                {
                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetDetail(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                    result.data = _customerAccountRepo.Get(id, _configurationData.DatabaseConnectionString, 0, 0);
                    result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableList<CustomerAccount>();            
            try
            {
                int sortColumn = 0, loginId = 0, firmId =0;
                string sortDirection = "asc", search = "";

                //// note: we only sort one column at a time
                search = Convert.ToString(Request.Query["search[value]"]);
                sortColumn = int.Parse(Request.Query["order[0][column]"]);
                sortDirection = Convert.ToString(Request.Query["order[0][dir]"]);

                var records = _customerAccountRepo.List(_configurationData.DatabaseConnectionString, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerAccount>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult Delete(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.Delete(id, _configurationData.DatabaseConnectionString, 0, 0);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetCustomerAccountGroups()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _customerAccountGroupRepo.GetCustomerAccountGroupList(_configurationData.DatabaseConnectionString, loginId, firmId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetCustomerBrokerBranchMappings()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _customerBrokerBranchMappingRepo.GetCustomerBrokerBranchMappingList(_configurationData.DatabaseConnectionString, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetCustomerAccounts()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _customerAccountRepo.GetCustomerAccountList(_configurationData.DatabaseConnectionString, loginId, firmId).ToList();
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}
