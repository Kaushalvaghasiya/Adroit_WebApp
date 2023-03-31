using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace Adroit.Accounting.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        //[Authorize(Roles = Utility.UserType.BackOffice + "," + Utility.UserType.Customer)]
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