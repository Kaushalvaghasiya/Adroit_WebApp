using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Web.Utility;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        public IActionResult MenuSetting()
        {
            var model = new MenuSettingViewModel();
            model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult MenuSettingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<MenuSettingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _menuSettingRepository.List(_configurationData.DefaultConnection, loginId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<MenuSettingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveMenuSetting([FromBody] MenuSetting model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.UserId = LoginHandler.GetUserId(User);
                int id = _menuSettingRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteMenuSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _menuSettingRepository.Delete(id, _configurationData.DefaultConnection);
                result.data = true;
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
        public JsonResult GetMenuSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.Get(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingBySoftware(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetBySoftware(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingBySoftwarePlan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetBySoftwarePlan(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingByCustomer(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetByCustomer(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingByCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetByFirm(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingByCustomerFirmBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetByBranch(id, _configurationData.DefaultConnection);
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
        public JsonResult GetMenuSettingByCustomerUser(int branchId, int userId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _menuSettingRepository.GetByUser(branchId, userId, _configurationData.DefaultConnection);
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