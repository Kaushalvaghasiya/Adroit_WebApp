using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Web.Utility;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : MasterController
    {
        public IActionResult BoxSetting()
        {
            var model = new BoxSettingViewModel();
            model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult BoxSettingList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<BoxSettingGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _boxSettingRepository.List(_configurationData.DefaultConnection, CurrentUserId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<BoxSettingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveBoxSetting([FromBody] BoxSetting model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.UserId = CurrentUserId;
                int id = _boxSettingRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteBoxSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _boxSettingRepository.Delete(id, _configurationData.DefaultConnection);
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
        public JsonResult GetBoxSetting(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _boxSettingRepository.Get(id, _configurationData.DefaultConnection);
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
        public JsonResult GetBoxSettingBySoftware(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _boxSettingRepository.GetBySoftware(id, _configurationData.DefaultConnection);
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
        public JsonResult GetBoxSettingByCustomer(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _boxSettingRepository.GetByCustomer(id, _configurationData.DefaultConnection);
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
        public JsonResult GetBoxSettingByCustomerFirm(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _boxSettingRepository.GetByFirm(id, _configurationData.DefaultConnection);
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