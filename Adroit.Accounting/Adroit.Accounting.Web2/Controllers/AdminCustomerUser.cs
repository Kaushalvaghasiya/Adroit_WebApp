using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Text;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        [Route("~/admin/customer/user")]
        public IActionResult CustomerUser(int? id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpGet]
        public JsonResult CustomerUserList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableList<CustomerUser>();
            try
            {
                int loginId = 0, firmId = 0;
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = CustomerUserRepo.List(ConfigurationData.DefaultConnection, loginId, firmId, search, start, length, sortColumn, sortDirection, customerId).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerUser>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveCustomerUser([FromBody] CustomerUser savedata)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                savedata.OwnerBranchId = 1;// need set from session

                if (savedata.Id == 0)
                {
                    var user = await UserManager.FindByNameAsync(savedata.Email);
                    if (user != null)
                    {
                        throw new Exception("This email is already associated with another account, please choose different email.");
                    }
                    user = CreateUser();
                    await UserStore.SetUserNameAsync(user, savedata.Email, CancellationToken.None);
                    await EmailStore.SetEmailAsync(user, savedata.Email, CancellationToken.None);
                    var res = await UserManager.CreateAsync(user);
                    if (res.Succeeded)
                    {
                        var userId = await UserManager.GetUserIdAsync(user);
                        savedata.UserId = new Guid(userId);

                        int id = CustomerUserRepo.Save(savedata, ConfigurationData.DefaultConnection);
                        if (id > 0)
                        {
                            result.data = true;
                            result.result = Constant.API_RESULT_SUCCESS;
                        }
                    }
                    else
                    {
                        System.Text.StringBuilder errors = new StringBuilder();
                        foreach (var item in res.Errors)
                        {
                            errors.AppendLine(item.Description);
                        }
                        result.data = errors.ToString();
                        result.result = Constant.API_RESULT_ERROR;
                    }
                }
                else
                {
                    int id = CustomerUserRepo.Save(savedata, ConfigurationData.DefaultConnection);
                    if (id > 0)
                    {
                        result.data = true;
                        result.result = Constant.API_RESULT_SUCCESS;
                    }
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
        public JsonResult DeleteCustomerUser(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var UserId = 1;// Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);
                               //need change login customer id
                int DeletedById = 1; //need to set from session
                CustomerUserRepo.Delete(id, DeletedById, ConfigurationData.DefaultConnection);
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
        public JsonResult GetCustomerUser(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = CustomerUserRepo.Get(id, ConfigurationData.DefaultConnection);
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
        public JsonResult GetCustomerBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = CustomerUserRepo.GetBranchWIthFirmName(id, ConfigurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [AllowAnonymous]
        private IdentityUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<IdentityUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(IdentityUser)}'. " +
                    $"Ensure that '{nameof(IdentityUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }

        [AllowAnonymous]
        private IUserEmailStore<IdentityUser> GetEmailStore()
        {
            if (!UserManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)UserStore;
        }
    }
}