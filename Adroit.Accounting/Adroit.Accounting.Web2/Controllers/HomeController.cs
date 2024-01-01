using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Utility;
using Microsoft.Extensions.Options;
using System.Data.SqlClient;
using System.Data;

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
            ViewBag.BranchID = data.LoggedInBranchId??0;
            ViewBag.YearID = data.LoggedInYear??0;

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

        [Route("~/DataTesting")]
        public IActionResult DataTesting()
        {
            //return Content($"<script>window.open('{redirectUrl}', '_blank');</script>");
            return View();
        }

        [Route("~/Home/ExecuteQuery/{query}")]
        public ActionResult ExecuteQuery(string query)
        {
            try
            {
                if (string.IsNullOrEmpty(query))
                {
                    return Content("Error: Query is empty or null.");
                }

                string connectionString = _configurationData.DefaultConnection;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string[] queries = query.Split(';');

                    DataSet dataSet = new DataSet();

                    foreach (var individualQuery in queries)
                    {
                        if (!string.IsNullOrWhiteSpace(individualQuery))
                        {
                            using (SqlCommand command = new SqlCommand(individualQuery, connection))
                            {
                                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                                {
                                    DataTable dataTable = new DataTable();
                                    adapter.Fill(dataTable);

                                    dataSet.Tables.Add(dataTable);
                                }
                            }
                        }
                    }

                    return PartialView("_ResultTablePartial", dataSet);
                }
            }
            catch (Exception ex)
            {
                return Content($"Error: {ex.Message}");
            }
        }

    }
}