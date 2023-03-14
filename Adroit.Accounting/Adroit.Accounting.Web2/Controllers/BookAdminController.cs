using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Data;

namespace Adroit.Accounting.Web2.Controllers
{
    public class BookAdminController : Controller
    {
        protected readonly IBookAdminRepository _bookAdminRepo;
        protected readonly IAccountAdminRepository _accountAdminRepo;
        protected readonly IBillTypeAdminRepository _billTypeAdminRepo;
        protected readonly IBillEntryTypeAdminRepository _billEntryTypeAdminRepo;
        protected readonly ConfigurationData _configurationData;

        public BookAdminController(IBookAdminRepository bookAdminRepo,
            IOptions<ConfigurationData> configurationData,
            IAccountAdminRepository accountAdminRepo,IBillTypeAdminRepository billTypeAdminRepo,
            IBillEntryTypeAdminRepository billEntryTypeAdminRepo)
        {
            _bookAdminRepo = bookAdminRepo;
            _configurationData = configurationData.Value;
            _accountAdminRepo = accountAdminRepo;
            _billTypeAdminRepo = billTypeAdminRepo;
            _billEntryTypeAdminRepo= billEntryTypeAdminRepo;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Save([FromBody] BookAdmin model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _bookAdminRepo.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult Get(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _bookAdminRepo.Get(id, _configurationData.DefaultConnection, 0, 0);
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
        public JsonResult List(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableList<BookAdmin>();
            try
            {
                int sortColumn = 0, loginId = 0, firmId = 0;
                string sortDirection = "asc", search = "";

                //// note: we only sort one column at a time
                //search = Convert.ToString(Request.Query["search[value]"]);
                //sortColumn = int.Parse(Request.Query["order[0][column]"]);
                //sortDirection = Convert.ToString(Request.Query["order[0][dir]"]);

                var records = _bookAdminRepo.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<BookAdmin>();
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
                result.data = _bookAdminRepo.Delete(id, _configurationData.DefaultConnection, 0, 0);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetAccountAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _accountAdminRepo.GetAccountAdminList(_configurationData.DefaultConnection, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetBillTypeAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _billTypeAdminRepo.GetBillTypeAdminList(_configurationData.DefaultConnection, loginId, firmId).ToList(); ;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public JsonResult GetBillEntryTypeAdmins()
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = 0, firmId = 0;
                result.data = _billEntryTypeAdminRepo.GetBillEntryTypeAdminList(_configurationData.DefaultConnection, loginId, firmId).ToList(); ;
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
