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
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.InvoiceDone)}", Value = $"{(int)InvoiceStatusList.InvoiceDone}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(InvoiceStatusList.PendingInvoice)}", Value = $"{(int)InvoiceStatusList.PendingInvoice}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetLRViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.AllLR)}", Value = $"{(int)LRViewList.AllLR}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.PastYearLR)}", Value = $"{(int)LRViewList.PastYearLR}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRViewList.CurrentYearLR)}", Value = $"{(int)LRViewList.CurrentYearLR}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.DateWise)}", Value = $"{(int)ViewList.DateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.LRWise)}", Value = $"{(int)ViewList.LRWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.PartyWise)}", Value = $"{(int)ViewList.PartyWise}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetBookingReportViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.DateWise)}", Value = $"{(int)ViewList.DateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.LRWise)}", Value = $"{(int)ViewList.LRWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.ToCityWise)}", Value = $"{(int)ViewList.ToCityWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.ConsignorWise)}", Value = $"{(int)ViewList.ConsignorWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.ConsigneeWise)}", Value = $"{(int)ViewList.ConsigneeWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ViewList.BillPartyWise)}", Value = $"{(int)ViewList.BillPartyWise}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetChalanList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.All)}", Value = $"{(int)ChalanList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.ChalanDone)}", Value = $"{(int)ChalanList.ChalanDone}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanList.PendingChalan)}", Value = $"{(int)ChalanList.PendingChalan}" },
            };
            return list;
        }public static List<DropdownViewModel> GetChalanViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanViewList.DateWise)}", Value = $"{(int)ChalanViewList.DateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(ChalanViewList.TruckWise)}", Value = $"{(int)ChalanViewList.TruckWise}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetVoucheBookViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.CashPayment)}", Value = $"{(int)VoucheBookViewList.CashPayment}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.CashReceive)}", Value = $"{(int)VoucheBookViewList.CashReceive}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.BankPayment)}", Value = $"{(int)VoucheBookViewList.BankPayment}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(VoucheBookViewList.BankReceive)}", Value = $"{(int)VoucheBookViewList.BankReceive}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetDateWiseTDSDetailViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TDSDateWise)}", Value = $"{(int)DateWiseTDSDetailViewList.TDSDateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TCSDateWise)}", Value = $"{(int)DateWiseTDSDetailViewList.TCSDateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TDSPartyWise)}", Value = $"{(int)DateWiseTDSDetailViewList.TDSPartyWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(DateWiseTDSDetailViewList.TCSPartyWise)}", Value = $"{(int)DateWiseTDSDetailViewList.TCSPartyWise}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetTransactionTypeViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(TransactionTypeViewList.SalesActivity)}", Value = $"{(int)TransactionTypeViewList.SalesActivity}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(TransactionTypeViewList.PurchaseActivity)}", Value = $"{(int)TransactionTypeViewList.PurchaseActivity}" },
            };
            return list;
        }

        public static List<DropdownViewModel> GetBrokerWiseDetailViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BrokerWiseDetailViewList.PartyWise)}", Value = $"{(int)BrokerWiseDetailViewList.PartyWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BrokerWiseDetailViewList.BrokerWise)}", Value = $"{(int)BrokerWiseDetailViewList.BrokerWise}" },
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
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseBy.GenExps)}", Value = $"{(int)PurchaseBy.GenExps}" },
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
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.TaxInvoice)}", Value = $"{(int)PurchaseInvoiceType.TaxInvoice}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.BillOfSupply)}", Value = $"{(int)PurchaseInvoiceType.BillOfSupply}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(PurchaseInvoiceType.RetailInvoice)}", Value = $"{(int)PurchaseInvoiceType.RetailInvoice}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetSalesViewList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.DateWise)}", Value = $"{(int)SalesViewList.DateWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.PartyWise)}", Value = $"{(int)SalesViewList.PartyWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.QualityWise)}", Value = $"{(int)SalesViewList.QualityWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.BrokerWise)}", Value = $"{(int)SalesViewList.BrokerWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.BookWise)}", Value = $"{(int)SalesViewList.BookWise}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(SalesViewList.HSNWise)}", Value = $"{(int)SalesViewList.HSNWise}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetGSTTransactionTypeList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.All)}", Value = $"{(int)GSTTransactionTypeList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.IntraState)}", Value = $"{(int)GSTTransactionTypeList.IntraState}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(GSTTransactionTypeList.InterState)}", Value = $"{(int)GSTTransactionTypeList.InterState}" },
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
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.RevCharge)}", Value = $"{(int)CustomerTypeList.RevCharge}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(CustomerTypeList.URD)}", Value = $"{(int)CustomerTypeList.URD}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetBookingLRInvoiceStatusList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BookingLRInvoiceStatusList.All)}", Value = $"{(int)BookingLRInvoiceStatusList.All}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BookingLRInvoiceStatusList.InvoiceDone)}", Value = $"{(int)BookingLRInvoiceStatusList.InvoiceDone}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(BookingLRInvoiceStatusList.PendingInvoice)}", Value = $"{(int)BookingLRInvoiceStatusList.PendingInvoice}" },
            };
            return list;
        }
        public static List<DropdownViewModel> GetBookingLRStatusList()
        {
            List<DropdownViewModel> list = new List<DropdownViewModel>
            {
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRStatus.Active)}", Value = $"{(int)LRStatus.Active}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRStatus.Cancelled)}", Value = $"{(int)LRStatus.Cancelled}" },
                new DropdownViewModel() { Text = $"{EnumDesc.DescriptionAttr(LRStatus.All)}", Value = $"{(int)LRStatus.All}" },
            };
            return list;
        }
    }
}
