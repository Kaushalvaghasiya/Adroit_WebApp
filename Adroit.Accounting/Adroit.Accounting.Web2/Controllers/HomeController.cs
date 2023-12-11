using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Utility;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class HomeController : MasterController
    {
        private readonly ILogger<HomeController> _logger;
        private IAdminCustomerUser _adminCustomerUserRepository;
        public HomeController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            ILogger<HomeController> logger,
            IAdminCustomerUser adminCustomerUserRepository)
            : base(loginHandler, userRepository, configurationData)
        {
            _logger = logger;
            _adminCustomerUserRepository = adminCustomerUserRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        [Route("~/BranchSelection")]
        public IActionResult BranchSelection()
        {
            var data = _adminCustomerUserRepository.Get(CurrentUserId, _configurationData.DefaultConnection);
            ViewBag.BranchID = data.LoggedInBranchId;
            ViewBag.YearID = data.LoggedInYear;

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}