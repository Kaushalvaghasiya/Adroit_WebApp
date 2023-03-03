using Adroit.Accounting.Repository;
using Adroit.Accounting.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
	public class CustomerController : Controller
	{
		private ICustomerRepository _customerRepo;
		private IStateRepository _stateRepo;
		private ICityRepository _cityRepo;
		private ICountryRepository _countryRepo;
		private IBusinessRepository _businessRepo;
		private readonly ConfigurationData _configurationData;
		private readonly IConfiguration _configuration;
		private readonly EmailSetup _emailData;
		private readonly UserManager<IdentityUser> _userManager;
		private readonly IUserStore<IdentityUser> _userStore;
		private readonly IUserEmailStore<IdentityUser> _emailStore;
		public CustomerController(ICustomerRepository customerRepo, IStateRepository stateRepo, ICityRepository cityRepo,
				IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData, ICountryRepository countryRepo,
				IBusinessRepository businessRepo, IConfiguration configuration, UserManager<IdentityUser> userManager,
				IUserStore<IdentityUser> userStore)
		{
			_customerRepo = customerRepo;
			_stateRepo = stateRepo;
			_cityRepo = cityRepo;
			_configurationData = configurationData.Value;
			_emailData = emailData.Value;
			_countryRepo = countryRepo;
			_businessRepo = businessRepo;
			_configuration = configuration;
			_userManager = userManager;
			_userStore = userStore;
			_emailStore = GetEmailStore();
		}
		public IActionResult Login()
		{
			return View();
		}

		public IActionResult Registration()
		{
			Customer model = new Customer();
			model.Id = 0;
			ViewBag.EmptyList = new SelectList(Enumerable.Empty<SelectListItem>());

			List<Country> countries = new List<Country>();
			countries = _countryRepo.GetCountryList(_configurationData.DefaultConnection).ToList();
			ViewBag.CountryList = new SelectList(countries, "Id", "Title");
			ViewBag.CountryCodeList = new SelectList(countries, "Id", "PhoneCode");

			List<Business> businesses = new List<Business>();
			businesses = _businessRepo.GetBusinessList(_configurationData.DefaultConnection).ToList();
			ViewBag.BusinessList = new SelectList(businesses, "Id", "Title");
			return View(model);
		}

		[HttpPost]
		public async Task<JsonResult> Registration([FromBody] Customer model)
		{
			ApiResult result = new ApiResult();
			try
			{
				var user = CreateUser();
				await _userStore.SetUserNameAsync(user, model.Email, CancellationToken.None);
				await _emailStore.SetEmailAsync(user, model.Email, CancellationToken.None);
				var res = await _userManager.CreateAsync(user);
				if (res.Succeeded)
				{
					Customer customer = _customerRepo.Get(model.Email, _configurationData.DefaultConnection);
					if (customer == null)
					{
						model.EmailOtp = RandomNumber.SixDigigNumber();
						model.MobileOtp = RandomNumber.SixDigigNumber();
						model.StatusId = (short)CustomerStatus.Registered;
						int id = _customerRepo.Save(model, _configurationData.DefaultConnection);
						if (id > 0)
						{
							result.data = true;
							result.result = Constant.API_RESULT_SUCCESS;
							//send email
							var userId = await _userManager.GetUserIdAsync(user);
							var code = await _userManager.GeneratePasswordResetTokenAsync(user);
							code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));

							string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Customer/VerifyOtpAndSetPassword?userId={userId}&code={code}";
							var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\OTPEmail.html"));
							msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "");
							msgBody = msgBody.Replace("{OTP}", model.EmailOtp);
							msgBody = msgBody.Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
							//msgBody = msgBody.Replace("{ResetUrl}", $"{_configuration.GetSection("SiteUrl").Value}/Customer/ResetPassword?email={model.Email}&code={code}");
							//msgBody = msgBody.Replace("{ResetUrl}", $"{url}/Customer/ResetPassword?userId={userId}&code={code}");
							Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
															_emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration OTP and Reset password", msgBody, ""));
						}
					}
					else
					{
						result.data = "Email already exists.";
						result.result = Constant.API_RESULT_ERROR;
					}
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
			catch (Exception ex)
			{
				result.data = ErrorHandler.GetError(ex);
				result.result = Constant.API_RESULT_ERROR;
			}
			return Json(result);
		}

		public JsonResult EmailExists(string email)
		{
			ApiResult result = new ApiResult();
			try
			{
				Customer customer = _customerRepo.Get(email, _configurationData.DefaultConnection);
				if (customer == null)
				{
					result.data = false;
					result.result = Constant.API_RESULT_SUCCESS;
				}
				else
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

		public JsonResult GetStates(int countryId)
		{
			ApiResult result = new ApiResult();
			try
			{
				List<State> states = new List<State>();
				states = _stateRepo.GetStateList(_configurationData.DefaultConnection, countryId).ToList();
				result.data = states;
				result.result = Constant.API_RESULT_SUCCESS;
			}
			catch (Exception ex)
			{
				result.data = ErrorHandler.GetError(ex);
				result.result = Constant.API_RESULT_ERROR;
			}
			return Json(result);
		}

		public JsonResult GetCities(int stateId)
		{
			ApiResult result = new ApiResult();
			try
			{
				List<City> cities = new List<City>();
				cities = _cityRepo.GetCityList(_configurationData.DefaultConnection, stateId, 0, 0).ToList();
				result.data = cities;
				result.result = Constant.API_RESULT_SUCCESS;
			}
			catch (Exception ex)
			{
				result.data = ErrorHandler.GetError(ex);
				result.result = Constant.API_RESULT_ERROR;
			}
			return Json(result);
		}

		#region Customer Verify and Reset password
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
					string url = $"{Request.Scheme}://{Request.Host.ToUriComponent()}/Customer/ResetPassword?code={code}";
					var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\ResetPassword.html"));
					msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : model.Email);
					msgBody = msgBody.Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
					Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
													_emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration Reset password", msgBody, ""));
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
		#endregion

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
