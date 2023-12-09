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
        public HomeController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            ILogger<HomeController> logger)
            : base(loginHandler, userRepository, configurationData)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
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