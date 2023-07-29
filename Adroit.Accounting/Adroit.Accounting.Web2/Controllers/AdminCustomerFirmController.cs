using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        [Route("~/admin/customer/firm")]
        public IActionResult CustomerFirm(int? id = 0, int? editid = 0)
        {
            CustomerFirmViewModel model = new();
            model.Customer = _customerRepository.Get(id ?? 0, _configurationData.DefaultConnection);
            model.BusinessList = _businessRepository.SelectList(_configurationData.DefaultConnection);
            model.GSTFirmTypeList = _gSTFirmTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.FirmTypeList = _firmTypeRepository.SelectList(_configurationData.DefaultConnection);
            //model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);

            ViewBag.EditId = editid;

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerFirmList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<CustomerFirmGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int firmId = LoginHandler.GetFirmId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerFirmRepository.List(_configurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection, customerId).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerFirmGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomerFirm([FromBody] CustomerFirm model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.AddedById = LoginHandler.GetUserId(User);
                model.ModifiedById = LoginHandler.GetUserId(User);
                int id = _customerFirmRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _customerFirmRepository.Delete(id, LoginHandler.GetUserId(User), _configurationData.DefaultConnection);
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
        public JsonResult GetCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerFirmRepository.Get(id, _configurationData.DefaultConnection);
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