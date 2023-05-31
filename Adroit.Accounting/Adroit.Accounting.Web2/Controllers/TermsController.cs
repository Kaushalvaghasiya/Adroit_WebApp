using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public class TermsController : Controller
    {
        private readonly ILogger<TermsController> _logger;
        public TermsController(ILogger<TermsController> logger)
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
