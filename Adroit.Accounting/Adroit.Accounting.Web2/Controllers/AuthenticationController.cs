﻿using Adroit.Accounting.Model;
using Microsoft.AspNetCore.Mvc;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Microsoft.Extensions.Options;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Model.Enums;
using Microsoft.AspNetCore.Identity;
using System.Text;
using Microsoft.AspNetCore.WebUtilities;
using System.Text.Encodings.Web;
using Adroit.Accounting.Model.ViewModel;
using Microsoft.CodeAnalysis.Emit;

namespace Adroit.Accounting.Web.Controllers
{
    public class AuthenticationController : Controller
    {
        private ICustomer _customerRepo;
        private readonly ConfigurationData _configurationData;
        private readonly IEmailService _emailService;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly ILogger<AuthenticationController> _logger;
        public AuthenticationController(ICustomer customerRepo,
            IOptions<ConfigurationData> configurationData,
            IEmailService emailService,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ILogger<AuthenticationController> logger)
        {
            _customerRepo = customerRepo;
            _configurationData = configurationData.Value;
            _emailService = emailService;
            _userManager = userManager;
            _userStore = userStore;
            _logger = logger;
        }
        public IActionResult VerifyOtpAndSetPassword(string userId, string code)
        {

            ViewBag.IdentityUserId = userId;
            ViewBag.TokenCode = code;

            return View();
        }

        [HttpPost]
        public async Task<JsonResult> VerifyOtpAndSetPassword([FromBody] PasswordResetViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var user = await _userManager.FindByIdAsync($"{model.IdentityUserId}");
                if (user != null)
                {
                    var customer = _customerRepo.Get(user.Email, _configurationData.DefaultConnection);
                    if (customer != null)
                    {
                        if (customer.EmailOtp == customer.EmailOtp) //&& customer.MobileOtp == model.MobileOtp)
                        {
                            model.TokenCode = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(model.TokenCode));
                            var res = await _userManager.ResetPasswordAsync(user, model.TokenCode, model.Password);
                            if (res.Succeeded)
                            {
                                customer.StatusId = CustomerStatus.Verified;
                                int id = _customerRepo.Save(customer, _configurationData.DefaultConnection);

                                var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                                var emailconfirmresult = await _userManager.ConfirmEmailAsync(user, code);

                                result.data = true;
                                result.result = Constant.API_RESULT_SUCCESS;
                            }
                            else
                            {
                                StringBuilder errors = new StringBuilder();
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
                            result.data = "OTP does not verified.";
                            result.result = Constant.API_RESULT_ERROR;
                        }
                    }
                    else
                    {
                        result.data = "User does not exists.";
                        result.result = Constant.API_RESULT_ERROR;
                    }
                }
                else
                {
                    result.data = "User does not exists.";
                    result.result = Constant.API_RESULT_ERROR;
                }

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "AuthenticationController.VerifyOtpAndSetPassword");
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }

            return Json(result);
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> ForgotPassword([FromBody] PasswordResetViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var user = await _userManager.FindByEmailAsync(model.Email);
                if (user != null)
                {
                    var customer = _customerRepo.Get(user.Email, _configurationData.DefaultConnection);
                    var code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(await _userManager.GeneratePasswordResetTokenAsync(user).ConfigureAwait(false)));
                    string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Authentication/ResetPassword?code={code}";

                    var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\ResetPassword.html"));
                    msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(customer.Name) ? customer.Name : customer.Email);
                    msgBody = msgBody.Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
                    var emailresult = _emailService.SendEmail(customer.Email, "Adroit Accounting System - Password Reset", msgBody);
                    _logger.LogError($"AuthenticationController.ForgotPassword Send Email to {customer.Email} Result: {emailresult}");

                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
                else
                {
                    result.data = "User does not exists.";
                    result.result = Constant.API_RESULT_ERROR;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "AuthenticationController.ForgotPassword");
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        public IActionResult ResetPassword(string code)
        {
            ViewBag.TokenCode = code;
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> ResetPassword([FromBody] PasswordResetViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                var user = await _userManager.FindByEmailAsync(model.Email);
                if (user != null)
                {
                    Customer customer = _customerRepo.Get(user.Email, _configurationData.DefaultConnection);
                    if (customer != null)
                    {
                        model.TokenCode = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(model.TokenCode));
                        var res = await _userManager.ResetPasswordAsync(user, model.TokenCode, model.Password);
                        if (res.Succeeded)
                        {
                            customer.StatusId = CustomerStatus.Verified;
                            int id = _customerRepo.Save(customer, _configurationData.DefaultConnection);

                            result.data = true;
                            result.result = Constant.API_RESULT_SUCCESS;
                        }
                        else
                        {
                            StringBuilder errors = new StringBuilder();
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
                        result.data = "User does not exists.";
                        result.result = Constant.API_RESULT_ERROR;
                    }
                }
                else
                {
                    result.data = "User does not exists.";
                    result.result = Constant.API_RESULT_ERROR;
                }

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "AuthenticationController.ResetPassword");
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }

            return Json(result);
        }
    }
}
