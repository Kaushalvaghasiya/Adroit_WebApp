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
        private readonly ConfigurationData _configurationData;
        private readonly EmailSetup _emailData;
        public CustomerController(ICustomerRepository customerRepo, IStateRepository stateRepo, ICityRepository cityRepo,
                IOptions<ConfigurationData> configurationData, IOptions<EmailSetup> emailData)
        {
            _customerRepo = customerRepo;
            _stateRepo = stateRepo;
            _cityRepo = cityRepo;
            _configurationData = configurationData.Value;
            _emailData = emailData.Value;
        }
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Registration()
        {
            Customer model = new Customer();
            model.Id = 0;

            List<City> cities = new List<City>();
            ViewBag.CityData = cities;
            cities = _cityRepo.GetCityList(_configurationData.DatabaseConnectionString).ToList();
            ViewBag.CityData = new SelectList(cities, "Id", "Title");

            List<State> states = new List<State>();
            ViewBag.StateData = states;
            states = _stateRepo.GetStateList(_configurationData.DatabaseConnectionString).ToList();
            ViewBag.StateData = new SelectList(states, "Id", "Title");
            return View(model);
        }

        [HttpPost]
        public JsonResult Registration([FromBody] Customer model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int id = _customerRepo.Save(model, _configurationData.DatabaseConnectionString);
                if (id > 0)
                {
                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                    //send email
                    string message = "Hello " + model.Name;
                    Task.Factory.StartNew(() => EmailHelper.SendEmail(_emailData.EmailUsername, _emailData.EmailPassword, _emailData.DisplayName, Convert.ToInt32(_emailData.ServerPort),
                                                    _emailData.ServerHost, _emailData.IsEnableSSL, model.Email, "New Inquiry from Customer", message, ""));
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
