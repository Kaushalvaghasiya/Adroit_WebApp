using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.ViewModel;
using System.ComponentModel;
using System.Reflection;

namespace Adroit.Accounting.Web.Utility
{
    //I wish to log in places outside the controller
    //for example here.
    public static class EnumDesc
    {
        public static string DescriptionAttr<T>(this T source)
        {
            FieldInfo fi = source.GetType().GetField(source.ToString());

            DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(
                typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0) return attributes[0].Description;
            else return source.ToString();
        }
    }
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
        public static List<DropdownViewModel> GetInvoiceStatusList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.All)}", Value = $"{(int)InvoiceStatusList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.Invoice_Done)}", Value = $"{(int)InvoiceStatusList.Invoice_Done}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.Pending_Invoice)}", Value = $"{(int)InvoiceStatusList.Pending_Invoice}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.Forward_Chalan)}", Value = $"{(int)InvoiceStatusList.Forward_Chalan}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetLRViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.All_LR)}", Value = $"{(int)LRViewList.All_LR}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.Past_Year_LR)}", Value = $"{(int)LRViewList.Past_Year_LR}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.Current_Year_LR)}", Value = $"{(int)LRViewList.Current_Year_LR}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.Date_Wise)}", Value = $"{(int)ViewList.Date_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.LR_Wise)}", Value = $"{(int)ViewList.LR_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.Party_Wise)}", Value = $"{(int)ViewList.Party_Wise}" },
            };
            return list;
        }
    }
}
