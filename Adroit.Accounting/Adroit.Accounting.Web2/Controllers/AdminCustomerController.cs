using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Controllers;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Data;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller

    {
        public IActionResult Customer()
        {
            return View();
        }

        [HttpGet]
        public JsonResult CustomerList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableList<Customer>();
            try
            {
                int sortColumn = 0, loginId = 0, firmId = 0;
                string sortDirection = "asc", search = "";

                var records = CustomerRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<Customer>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveCustomer([FromBody] Customer savedata)
        {
            ApiResult result = new ApiResult();
            try
            {
                savedata.BusinessName = "test"; //Need to change after confimation
                savedata.AgreeTerms = true;//Need to change after confimation
                savedata.CustomerType = Model.Enums.CustomerType.Customer; // need to check how to pass enum value in json
                int id = CustomerRepo.Save(savedata, ConfigurationData.DefaultConnection);
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

        [HttpDelete]
        public JsonResult DeleteCustomer(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                CustomerRepo.Delete(id, ConfigurationData.DefaultConnection);
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