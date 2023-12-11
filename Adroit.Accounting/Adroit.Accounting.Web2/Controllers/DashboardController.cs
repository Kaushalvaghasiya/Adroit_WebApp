using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Options;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class DashboardController : MasterController
    {
        public DashboardController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData)
            : base(loginHandler, userRepository, configurationData) { }
        public IActionResult Index()
        {
            return View();
        }
    }
}