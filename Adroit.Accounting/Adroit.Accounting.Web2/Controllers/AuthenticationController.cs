using Adroit.Accounting.Model;
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

namespace Adroit.Accounting.Web.Controllers
{
	public class AuthenticationController : Controller
	{
		private ICustomerRepository _customerRepo;
		private readonly ConfigurationData _configurationData;
		private readonly EmailSetup _emailData;
		private readonly UserManager<IdentityUser> _userManager;
		private readonly IUserStore<IdentityUser> _userStore;
		public AuthenticationController(ICustomerRepository customerRepo, 
			IOptions<ConfigurationData> configurationData, 
			IOptions<EmailSetup> emailData, 
			UserManager<IdentityUser> userManager,
			IUserStore<IdentityUser> userStore)
		{
			_customerRepo = customerRepo;
			_configurationData = configurationData.Value;
			_emailData = emailData.Value;
			_userManager = userManager;
			_userStore = userStore;
		}
		public IActionResult VerifyOtpAndSetPassword(string userId, string code)
		{
			Customer model = new Customer();
			model.IdentityUserId = userId;
			model.TokenCode = code;
			return View(model);
		}

		[HttpPost]
		public async Task<JsonResult> VerifyOtpAndSetPassword([FromBody] Customer model)
		{
			ApiResult result = new ApiResult();
			try
			{
				var user = await _userManager.FindByIdAsync(model.IdentityUserId);
				if (user != null)
				{
					Customer customer = _customerRepo.Get(user.Email, _configurationData.DefaultConnection);
					if (customer != null)
					{
						if (customer.EmailOtp == model.EmailOtp) //&& customer.MobileOtp == model.MobileOtp)
						{
							model.TokenCode = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(model.TokenCode));
							var res = await _userManager.ResetPasswordAsync(user, model.TokenCode, model.Password);
							if (res.Succeeded)
							{
								customer.StatusId = (short)CustomerStatus.Verified;
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
							result.data = "OTP not verified.";
							result.result = Constant.API_RESULT_ERROR;
						}
					}
					else
					{
						result.data = "User not exists.";
						result.result = Constant.API_RESULT_ERROR;
					}
				}
				else
				{
					result.data = "User not exists.";
					result.result = Constant.API_RESULT_ERROR;
				}

			}
			catch (Exception ex)
			{
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
		public async Task<JsonResult> ForgotPassword([FromBody] Customer model)
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
						model.Name = customer.Name;
					}
					var code = await _userManager.GeneratePasswordResetTokenAsync(user);
					code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
					string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Authentication/ResetPassword?code={code}";
					var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\ResetPassword.html"));
					msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : model.Email);
					msgBody = msgBody.Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
					await Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
													_emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration Reset password", msgBody, "")).ConfigureAwait(false);
					result.data = true;
					result.result = Constant.API_RESULT_SUCCESS;
				}
				else
				{
					result.data = "User not exists.";
					result.result = Constant.API_RESULT_ERROR;
				}
			}
			catch (Exception ex)
			{
				result.data = ErrorHandler.GetError(ex);
				result.result = Constant.API_RESULT_ERROR;
			}
			return Json(result);
		}

		public IActionResult ResetPassword(string code)
		{
			Customer model = new Customer();
			model.TokenCode = code;
			return View(model);
		}

		[HttpPost]
		public async Task<JsonResult> ResetPassword([FromBody] Customer model)
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
							customer.StatusId = (short)CustomerStatus.Verified;
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
						result.data = "User not exists.";
						result.result = Constant.API_RESULT_ERROR;
					}
				}
				else
				{
					result.data = "User not exists.";
					result.result = Constant.API_RESULT_ERROR;
				}

			}
			catch (Exception ex)
			{
				result.data = ErrorHandler.GetError(ex);
				result.result = Constant.API_RESULT_ERROR;
			}
			return Json(result);
		}
		private IUserEmailStore<IdentityUser> GetEmailStore()
		{
			if (!_userManager.SupportsUserEmail)
			{
				throw new NotSupportedException("The default UI requires a user store with email support.");
			}
			return (IUserEmailStore<IdentityUser>)_userStore;
		}
	}
}
