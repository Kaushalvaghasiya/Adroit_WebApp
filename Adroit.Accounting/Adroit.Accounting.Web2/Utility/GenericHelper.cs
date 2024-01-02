using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.ViewModel;
using System.ComponentModel;
using System.IO;
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
        public static List<DropdownViewModel> GetChalanList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.All)}", Value = $"{(int)ChalanList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.Chalan_Done)}", Value = $"{(int)ChalanList.Chalan_Done}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.Pending_Chalan)}", Value = $"{(int)ChalanList.Pending_Chalan}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetVoucheBookViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.Cash_Payment)}", Value = $"{(int)VoucheBookViewList.Cash_Payment}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.Cash_Receive)}", Value = $"{(int)VoucheBookViewList.Cash_Receive}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.Bank_Payment)}", Value = $"{(int)VoucheBookViewList.Bank_Payment}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.Bank_Receive)}", Value = $"{(int)VoucheBookViewList.Bank_Receive}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetDateWiseTDSDetailViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TDS_Date_Wise)}", Value = $"{(int)DateWiseTDSDetailViewList.TDS_Date_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TCS_Date_Wise)}", Value = $"{(int)DateWiseTDSDetailViewList.TCS_Date_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TDS_Party_Wise)}", Value = $"{(int)DateWiseTDSDetailViewList.TDS_Party_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TCS_Party_Wise)}", Value = $"{(int)DateWiseTDSDetailViewList.TCS_Party_Wise}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetTransactionTypeViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(TransactionTypeViewList.Sales_Activity)}", Value = $"{(int)TransactionTypeViewList.Sales_Activity}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(TransactionTypeViewList.Purchase_Activity)}", Value = $"{(int)TransactionTypeViewList.Purchase_Activity}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetBrokerWiseDetailViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BrokerWiseDetailViewList.Party_Wise)}", Value = $"{(int)BrokerWiseDetailViewList.Party_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BrokerWiseDetailViewList.Broker_Wise)}", Value = $"{(int)BrokerWiseDetailViewList.Broker_Wise}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetPaymentStatusViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PaymentStatusViewList.Paid)}", Value = $"{(int)PaymentStatusViewList.Paid}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PaymentStatusViewList.Unpaid)}", Value = $"{(int)PaymentStatusViewList.Unpaid}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetInvoiceTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceTypeList.All)}", Value = $"{(int)InvoiceTypeList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceTypeList.Sales)}", Value = $"{(int)InvoiceTypeList.Sales}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceTypeList.Return)}", Value = $"{(int)InvoiceTypeList.Return}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceTypeList.Export)}", Value = $"{(int)InvoiceTypeList.Export}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetChalanTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanType.All)}", Value = $"{(int)ChalanType.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanType.Chalan)}", Value = $"{(int)ChalanType.Chalan}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanType.Return)}", Value = $"{(int)ChalanType.Return}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanType.Export)}", Value = $"{(int)ChalanType.Export}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetPurchaseBy()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseBy.All)}", Value = $"{(int)PurchaseBy.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseBy.Purchase)}", Value = $"{(int)PurchaseBy.Purchase}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseBy.Gen_Exps)}", Value = $"{(int)PurchaseBy.Gen_Exps}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseBy.Import)}", Value = $"{(int)PurchaseBy.Import}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetPurchaseType()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseType.All)}", Value = $"{(int)PurchaseType.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseType.Purchase)}", Value = $"{(int)PurchaseType.Purchase}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseType.Return)}", Value = $"{(int)PurchaseType.Return}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseType.Import)}", Value = $"{(int)PurchaseType.Import}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetPurchaseInvoiceType()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.All)}", Value = $"{(int)PurchaseInvoiceType.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.Tax_Invoice)}", Value = $"{(int)PurchaseInvoiceType.Tax_Invoice}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.Bill_of_Supply)}", Value = $"{(int)PurchaseInvoiceType.Bill_of_Supply}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.Retail_Invoice)}", Value = $"{(int)PurchaseInvoiceType.Retail_Invoice}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetSalesViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.Date_Wise)}", Value = $"{(int)SalesViewList.Date_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.Party_Wise)}", Value = $"{(int)SalesViewList.Party_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.Quality_Wise)}", Value = $"{(int)SalesViewList.Quality_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.Broker_Wise)}", Value = $"{(int)SalesViewList.Broker_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.Book_Wise)}", Value = $"{(int)SalesViewList.Book_Wise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.HSN_Wise)}", Value = $"{(int)SalesViewList.HSN_Wise}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetGSTTransactionTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.All)}", Value = $"{(int)GSTTransactionTypeList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.Intra_State)}", Value = $"{(int)GSTTransactionTypeList.Intra_State}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.Inter_State)}", Value = $"{(int)GSTTransactionTypeList.Inter_State}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetPaymentStatusList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PaymentStatusList.All)}", Value = $"{(int)PaymentStatusList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PaymentStatusList.Paid)}", Value = $"{(int)PaymentStatusList.Paid}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PaymentStatusList.Unpaid)}", Value = $"{(int)PaymentStatusList.Unpaid}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetSalesCustomerTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.All)}", Value = $"{(int)CustomerTypeList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.Regular)}", Value = $"{(int)CustomerTypeList.Regular}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.Composition)}", Value = $"{(int)CustomerTypeList.Composition}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.Rev_Charge)}", Value = $"{(int)CustomerTypeList.Rev_Charge}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.URD)}", Value = $"{(int)CustomerTypeList.URD}" },
            };
            return list;
        }
    }
}
