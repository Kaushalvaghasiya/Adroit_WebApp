using Adroit.Accounting.Repository;
using Adroit.Accounting.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Microsoft.Extensions.Options;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Utility;
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
		public CustomerController(ICustomerRepository customerRepo, IStateRepository stateRepo, ICityRepository cityRepo,
				IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData, ICountryRepository countryRepo, IBusinessRepository businessRepo, IConfiguration configuration)
		{
			_customerRepo = customerRepo;
			_stateRepo = stateRepo;
			_cityRepo = cityRepo;
			_configurationData = configurationData.Value;
			_emailData = emailData.Value;
			_countryRepo = countryRepo;
			_businessRepo = businessRepo;
			_configuration = configuration;
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
			countries = _countryRepo.GetCountryList(_configurationData.DatabaseConnectionString).ToList();
			ViewBag.CountryList = new SelectList(countries, "Id", "Title");
			ViewBag.CountryCodeList = new SelectList(countries, "Id", "PhoneCode");

			List<Business> businesses = new List<Business>();
			businesses = _businessRepo.GetBusinessList(_configurationData.DatabaseConnectionString).ToList();
			ViewBag.BusinessList = new SelectList(businesses, "Id", "Title");
			return View(model);
		}

		[HttpPost]
		public JsonResult Registration([FromBody] Customer model)
		{
			ApiResult result = new ApiResult();
			try
			{
				Customer customer = _customerRepo.Get(model.Email, _configurationData.DatabaseConnectionString);
				if (customer == null)
				{
					model.EmailOtp = RandomNumber.SixDigigNumber();
					model.MobileOtp = RandomNumber.SixDigigNumber();
					model.StatusId = 1;
					int id = _customerRepo.Save(model, _configurationData.DatabaseConnectionString);
					if (id > 0)
					{
						result.data = true;
						result.result = Constant.API_RESULT_SUCCESS;
						//send email
						var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\OTPEmail.html"));
						msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "");
						msgBody = msgBody.Replace("{OTP}", model.EmailOtp);
                        msgBody = msgBody.Replace("{ResetUrl}", $"{_configuration.GetSection("SiteUrl").Value}/Customer/VerifyOTP?email={model.Email}");
                        Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
														_emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration OTP", msgBody, ""));
					}
				}
				else
				{
					result.data = "Email already exists.";
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
				Customer customer = _customerRepo.Get(email, _configurationData.DatabaseConnectionString);
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
				states = _stateRepo.GetStateList(_configurationData.DatabaseConnectionString, countryId).ToList();
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
				cities = _cityRepo.GetCityList(_configurationData.DatabaseConnectionString, stateId, 0, 0).ToList();
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

		public IActionResult VerifyOTP(string email)
		{
			Customer model = new Customer();
			model.Email = email;			
			return View(model);
		}

		[HttpPost]
		public JsonResult VerifyEmailMobile([FromBody] Customer model)
		{
			ApiResult result = new ApiResult();
			try
			{
				Customer customer = _customerRepo.Get(model.Email, _configurationData.DatabaseConnectionString);
				if (customer != null)
				{
					if(customer.EmailOtp == model.EmailOtp) //&& customer.MobileOtp == model.MobileOtp)
					{
						customer.StatusId = 2;
						int id = _customerRepo.Save(customer, _configurationData.DatabaseConnectionString);

						//send email
						//var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\ResetPassword.html"));
						//msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "");
						//msgBody = msgBody.Replace("{ResetUrl}", $"{_configuration.GetSection("SiteUrl")}/Customer/ResetPassword?email={model.Email}");
						//Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
						//								_emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "Adroit Registration OTP", msgBody, ""));

						result.data = true;
						result.result = Constant.API_RESULT_SUCCESS;
					}
					else
					{
						result.data = "OTP not verified.";
						result.result = Constant.API_RESULT_ERROR;
					}
				}
				else
				{
					result.data = false;
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

		public IActionResult ResetPassword(string email)
		{
			Customer model = new Customer();
			model.Email = email;
			return View(model);
		}
	}
}
