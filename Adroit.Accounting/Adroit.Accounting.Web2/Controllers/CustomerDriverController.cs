using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Driver(int id = 0)
        {
            DriverViewModel model = new DriverViewModel() { Id = id };
            model.CountryList = _countryRepository.SelectList(_configurationData.DefaultConnection);
            model.DriverNameList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, DriverTable._TableName, DriverTable.Name);
            model.DriverTypeList = _driverTypeAdmin.SelectList(_configurationData.DefaultConnection);
            model.LicenceIssuePlaceList = _driverRepository.SelectLicenceIssuePlace(_configurationData.DefaultConnection);
            return View(model);
        }

        [HttpGet]
        public JsonResult DriverList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<DriverGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _driverRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<DriverGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveDriver([FromBody] DriverViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.ModifiedById = CurrentUserId;
                model.AddedById = CurrentUserId;
                int id = _driverRepository.Save(model, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult DeleteDriver(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _driverRepository.Delete(id, CurrentUserId, _configurationData.DefaultConnection);
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
        public JsonResult GetDriver(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _driverRepository.Get(id, CurrentUserId, _configurationData.DefaultConnection);
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