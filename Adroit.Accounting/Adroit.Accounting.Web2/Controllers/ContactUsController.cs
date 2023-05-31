using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public class ContactUsController : Controller
    {
        private readonly ILogger<ContactUsController> _logger;
        public ContactUsController(ILogger<ContactUsController> logger)
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
