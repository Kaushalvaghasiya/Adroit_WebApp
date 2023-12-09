using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class ContactUsController : MasterController
    {
        private readonly ILogger<ContactUsController> _logger;
        public ContactUsController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData, ILogger<ContactUsController> logger)
            : base(loginHandler, userRepository, configurationData)
        {
            _logger = logger;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }
    }
}
