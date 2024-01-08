using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using System.Text;
using System.Text.Encodings.Web;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult CustomerUser()
        {
            CustomerUserViewModel model = new();
            var customerId = _customerRepository.GetCustomerIdByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            var Customer = _customerRepository.Get(customerId, _configurationData.DefaultConnection);

            if (Customer == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please ask your admin to add your customer data" });
            }
            else
            {
                model.Customer = Customer;
            }

            model.BranchList = _customerFirmBranchRepository.SelectListByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerUserList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<CustomerUserGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerUsersRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerUserGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveCustomerUser([FromBody] CustomerUser model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.OwnerBranchId = CurrentBranchId;
                model.AddedById = CurrentUserId;

                if (model.Id == 0)
                {
                    var user = await _userManager.FindByNameAsync(model.Email);
                    if (user != null)
                    {
                        throw new Exception("This email is already associated with another user, please choose different email.");
                    }

                    user = CreateUser();
                    await _userStore.SetUserNameAsync(user, model.Email, CancellationToken.None);
                    await _emailStore.SetEmailAsync(user, model.Email, CancellationToken.None);
                    var res = await _userManager.CreateAsync(user);
                    if (res.Succeeded)
                    {
                        var userId = await _userManager.GetUserIdAsync(user);
                        model.UserId = new Guid(userId);

                        int id = 0;
                        try
                        {
                            id = _customerUsersRepository.Save(model, CurrentUserId, CurrentFirmId, _configurationData.DefaultConnection);
                        }
                        catch (Exception ex)
                        {
                            //Delete membership user
                            await _userManager.DeleteAsync(user);

                            throw;
                        }

                        if (id > 0)
                        {
                            var customer = _customerRepository.Get(model.CustomerId, _configurationData.DefaultConnection);

                            //send email
                            var code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(await _userManager.GeneratePasswordResetTokenAsync(user).ConfigureAwait(false)));
                            string url = $"{_configurationData.SiteURL}/Authentication/ResetPassword?code={code}";

                            var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\EmailTemplate\ResetPassword.html"));
                            msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(customer.Name) ? customer.Name : customer.Email);
                            msgBody = msgBody.Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
                            var emailresult = _emailService.SendEmail(customer.Email, "Adroit Accounting System - Password Reset", msgBody);
                            _logger.LogError($"AuthenticationController.ForgotPassword Send Email to {customer.Email} Result: {emailresult}");

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
                    model.ModifiedById = CurrentUserId;
                    int id = _customerUsersRepository.Save(model, CurrentUserId, CurrentFirmId, _configurationData.DefaultConnection);
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

        [HttpGet]
        public JsonResult DeleteCustomerUser(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _customerUsersRepository.Delete(id, CurrentUserId, CurrentFirmId, _configurationData.DefaultConnection);
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
                result.data = _customerUsersRepository.Get(id, CurrentUserId, CurrentFirmId, _configurationData.DefaultConnection);
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
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)_userStore;
        }

        [HttpPost]
        public JsonResult UpdateUserLoggedInBranch(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                id = _customerUsersRepository.UpdateUserLoggedInBranch(CurrentUserId, id, _configurationData.DefaultConnection);
                if (id > 0)
                {
                    ClearCurrentFirmId();
                    ClearLoggedInBranchId();
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

        public JsonResult UpdateUserLoggedInYear(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                id = _customerUsersRepository.UpdateUserLoggedInYear(CurrentUserId, id, _configurationData.DefaultConnection);
                if (id > 0)
                {
                    ClearLoggedInYearId();
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
    }
}