using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Web.Utility
{
    //I wish to log in places outside the controller
    //for example here.
    public class GenericHelper
    {
        private readonly ILogger<GenericHelper> _logger;
        public GenericHelper(ILogger<GenericHelper> logger)
        {
            _logger = logger;
            _logger.LogInformation(1, "GenericHelper has been constructed");
        }
        public void JustADumbFunctionCall()
        {
            _logger.LogInformation("JustADumbFunctionCall has been called");
        }
        public static List<DropdownViewModel> GetCustomerTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{CustomerType.BackOffice}", Value = $"{(int)CustomerType.BackOffice}" },
                new DropdownViewModel() { Text = $"{CustomerType.Inquiry}", Value = $"{(int)CustomerType.Inquiry}" },
                new DropdownViewModel() { Text = $"{CustomerType.Demo}", Value = $"{(int)CustomerType.Demo}" },
                new DropdownViewModel() { Text = $"{CustomerType.FOC}", Value = $"{(int)CustomerType.FOC}" },
                new DropdownViewModel() { Text = $"{CustomerType.Customer}", Value = $"{(int)CustomerType.Customer}" }
            };
            return list;
        }

        public static List<DropdownViewModel> GetUserTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{UserType.BackOffice}", Value = $"{(int)UserType.BackOffice}" },
                new DropdownViewModel() { Text = $"{UserType.Customer}", Value = $"{(int)UserType.Customer}" }
            };
            return list;
        }
        public static List<DropdownViewModel> GetCustomerStatusList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{CustomerStatus.Verified}", Value = $"{(int)CustomerStatus.Verified}" },
                new DropdownViewModel() { Text = $"{CustomerStatus.Registered}", Value = $"{(int)CustomerStatus.Registered}" }
            };
            return list;
        }
    }
}
