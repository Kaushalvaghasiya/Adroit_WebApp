using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class MenuSettingRepository : IMenuSetting
    {
        public int Save(MenuSetting value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@SoftwareId", value.SoftwareId);
            parameters.Add("@SoftwarePlanId", value.SoftwarePlanId);
            parameters.Add("@CustomerId", value.CustomerId);
            parameters.Add("@CusomerFirmId", value.CusomerFirmId);
            parameters.Add("@CustomerFirmBranchId", value.CustomerFirmBranchId);
            parameters.Add("@CustomerUserId", value.CustomerUserId);
            parameters.Add("@Master__Adroit__Software__Software_Master", value.Master__Adroit__Software__Software_Master);
            parameters.Add("@Master__Adroit__Software__Plan", value.Master__Adroit__Software__Plan);
            parameters.Add("@Master__Adroit__Software__Businesses", value.Master__Adroit__Software__Businesses);
            parameters.Add("@Master__Adroit__Customer__Customers", value.Master__Adroit__Customer__Customers);
            parameters.Add("@Master__Adroit__Customer__Branch_Types", value.Master__Adroit__Customer__Branch_Types);
            parameters.Add("@Master__Adroit__Customer__Menu_Setting", value.Master__Adroit__Customer__Menu_Setting);
            parameters.Add("@Master__Adroit__Customer__Box_Setting", value.Master__Adroit__Customer__Box_Setting);
            parameters.Add("@Master__Adroit__Account__Accounts", value.Master__Adroit__Account__Accounts);
            parameters.Add("@Master__Adroit__Account__Secondary_Account_Group", value.Master__Adroit__Account__Secondary_Account_Group);
            parameters.Add("@Master__Adroit__Account__Primary_Account_Group", value.Master__Adroit__Account__Primary_Account_Group);
            parameters.Add("@Master__Adroit__Account__Books", value.Master__Adroit__Account__Books);
            parameters.Add("@Master__Adroit__Account__Book_Types", value.Master__Adroit__Account__Book_Types);
            parameters.Add("@Master__Adroit__Account__Bill_From", value.Master__Adroit__Account__Bill_From);
            parameters.Add("@Master__Adroit__Account__Book_Settings", value.Master__Adroit__Account__Book_Settings);
            parameters.Add("@Master__Adroit__Location__City", value.Master__Adroit__Location__City);
            parameters.Add("@Master__Adroit__Location__Taluka", value.Master__Adroit__Location__Taluka);
            parameters.Add("@Master__Adroit__Location__District", value.Master__Adroit__Location__District);
            parameters.Add("@Master__Adroit__Location__State", value.Master__Adroit__Location__State);
            parameters.Add("@Master__Adroit__Location__Country", value.Master__Adroit__Location__Country);
            parameters.Add("@Master__Adroit__GST__Rate", value.Master__Adroit__GST__Rate);
            parameters.Add("@Master__Adroit__GST__Invoice_Types", value.Master__Adroit__GST__Invoice_Types);
            parameters.Add("@Master__Adroit__GST__Ports", value.Master__Adroit__GST__Ports);
            parameters.Add("@Master__Adroit__GST__Collections", value.Master__Adroit__GST__Collections);
            parameters.Add("@Master__Adroit__Product__Colour", value.Master__Adroit__Product__Colour);
            parameters.Add("@Master__Adroit__Product__Amount_Calculations", value.Master__Adroit__Product__Amount_Calculations);
            parameters.Add("@Master__Adroit__Product__Size", value.Master__Adroit__Product__Size);
            parameters.Add("@Master__Adroit__Product__Stock_Types", value.Master__Adroit__Product__Stock_Types);
            parameters.Add("@Master__Adroit__Product__Quality_Types", value.Master__Adroit__Product__Quality_Types);
            parameters.Add("@Master__Adroit__Transport__Packing", value.Master__Adroit__Transport__Packing);
            parameters.Add("@Master__Adroit__Transport__Description", value.Master__Adroit__Transport__Description);
            parameters.Add("@Master__Adroit__Transport__LR_Charges", value.Master__Adroit__Transport__LR_Charges);
            parameters.Add("@Master__Customer__Firms", value.Master__Customer__Firms);
            parameters.Add("@Master__Customer__Branches", value.Master__Customer__Branches);
            parameters.Add("@Master__Customer__Users", value.Master__Customer__Users);
            parameters.Add("@Master__Account__Add", value.Master__Account__Add);
            parameters.Add("@Master__Account__Secondary_Account_Group", value.Master__Account__Secondary_Account_Group);
            parameters.Add("@Master__Account__Primary_Account_Group", value.Master__Account__Primary_Account_Group);
            parameters.Add("@Master__Product__Add", value.Master__Product__Add);
            parameters.Add("@Master__Product__Design", value.Master__Product__Design);
            parameters.Add("@Master__Product__Colour", value.Master__Product__Colour);
            parameters.Add("@Master__Product__Size", value.Master__Product__Size);
            parameters.Add("@Master__Product__Fabric", value.Master__Product__Fabric);
            parameters.Add("@Master__Product__Group", value.Master__Product__Group);
            parameters.Add("@Master__Product__Sub_Group", value.Master__Product__Sub_Group);
            parameters.Add("@Master__Product__Shade", value.Master__Product__Shade);
            parameters.Add("@Master__Product__Packing", value.Master__Product__Packing);
            parameters.Add("@Master__Broker", value.Master__Broker);
            parameters.Add("@Master__Machine", value.Master__Machine);
            parameters.Add("@Master__Yarn_Shade", value.Master__Yarn_Shade);
            parameters.Add("@Master__Yarn_Recipes", value.Master__Yarn_Recipes);
            parameters.Add("@Master__Process", value.Master__Process);
            parameters.Add("@Master__Cataloge", value.Master__Cataloge);
            parameters.Add("@Master__Employee", value.Master__Employee);
            parameters.Add("@Master__Location__City", value.Master__Location__City);
            parameters.Add("@Master__Location__Branch_City_Mapping", value.Master__Location__Branch_City_Mapping);
            parameters.Add("@Master__Vehicles", value.Master__Vehicles);
            parameters.Add("@Master__Drivers", value.Master__Drivers);
            parameters.Add("@Master__LR__Packing", value.Master__LR__Packing);
            parameters.Add("@Master__LR__Description", value.Master__LR__Description);
            parameters.Add("@Transaction__Booking__LR", value.Transaction__Booking__LR);
            parameters.Add("@Transaction__Booking__Chalan", value.Transaction__Booking__Chalan);
            parameters.Add("@Transaction__Booking__Invoice", value.Transaction__Booking__Invoice);
            parameters.Add("@Transaction__Delivery__Chalan_Receive", value.Transaction__Delivery__Chalan_Receive);
            parameters.Add("@Transaction__Delivery__Delivery_Invoice", value.Transaction__Delivery__Delivery_Invoice);
            parameters.Add("@Transaction__Sales__Quotation", value.Transaction__Sales__Quotation);
            parameters.Add("@Transaction__Sales__Praforma_Invoice", value.Transaction__Sales__Praforma_Invoice);
            parameters.Add("@Transaction__Sales__Sales_Order", value.Transaction__Sales__Sales_Order);
            parameters.Add("@Transaction__Sales__Chalan_Packing_Slip", value.Transaction__Sales__Chalan_Packing_Slip);
            parameters.Add("@Transaction__Sales__Sales", value.Transaction__Sales__Sales);
            parameters.Add("@Transaction__Sales__Sales_Return", value.Transaction__Sales__Sales_Return);
            parameters.Add("@Transaction__Purchase__Purchase_Order", value.Transaction__Purchase__Purchase_Order);
            parameters.Add("@Transaction__Purchase__Purchase_Chalan", value.Transaction__Purchase__Purchase_Chalan);
            parameters.Add("@Transaction__Purchase__Purchase", value.Transaction__Purchase__Purchase);
            parameters.Add("@Transaction__Purchase__Jobwork_Purchase", value.Transaction__Purchase__Jobwork_Purchase);
            parameters.Add("@Transaction__Purchase__Purchase_Return", value.Transaction__Purchase__Purchase_Return);
            parameters.Add("@Transaction__Purchase__General_Expenses", value.Transaction__Purchase__General_Expenses);
            parameters.Add("@Transaction__Purchase__General_Expenses_Multi", value.Transaction__Purchase__General_Expenses_Multi);
            parameters.Add("@Transaction__Credit_Note", value.Transaction__Credit_Note);
            parameters.Add("@Transaction__Debit_Note", value.Transaction__Debit_Note);
            parameters.Add("@Account__Payment__Bank_Payment", value.Account__Payment__Bank_Payment);
            parameters.Add("@Account__Payment__Cash_Payment", value.Account__Payment__Cash_Payment);
            parameters.Add("@Account__Receive__Bank_Receive", value.Account__Receive__Bank_Receive);
            parameters.Add("@Account__Receive__Cash_Receive", value.Account__Receive__Cash_Receive);
            parameters.Add("@Account__Account_Opening_Balance", value.Account__Account_Opening_Balance);
            parameters.Add("@Account__Product_Opening_Stock", value.Account__Product_Opening_Stock);
            parameters.Add("@Account__Journal_JV__General_JV", value.Account__Journal_JV__General_JV);
            parameters.Add("@Account__Journal_JV__Bill_Base_JV", value.Account__Journal_JV__Bill_Base_JV);
            parameters.Add("@Account__GST_Filling__GSTR_01", value.Account__GST_Filling__GSTR_01);
            parameters.Add("@Account__GST_Filling__GSTR_02_2A_2B", value.Account__GST_Filling__GSTR_02_2A_2B);
            parameters.Add("@Account__GST_Filling__GSTR_03B", value.Account__GST_Filling__GSTR_03B);
            parameters.Add("@Account__GST_Filling__GSTR_04_4B", value.Account__GST_Filling__GSTR_04_4B);
            parameters.Add("@Account__GST_Filling__GSTR_09_9C", value.Account__GST_Filling__GSTR_09_9C);
            parameters.Add("@Account__GST_Filling__ITC_04", value.Account__GST_Filling__ITC_04);
            parameters.Add("@Account__Reconsilation", value.Account__Reconsilation);
            parameters.Add("@Account__Cash_Auto_Payment", value.Account__Cash_Auto_Payment);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Detail_Register", value.Reports__SalesAndPurchase__Sales__Detail_Register);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Summary_Register", value.Reports__SalesAndPurchase__Sales__Summary_Register);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Item_Wise_Register", value.Reports__SalesAndPurchase__Sales__Item_Wise_Register);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Monthly_Register", value.Reports__SalesAndPurchase__Sales__Monthly_Register);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Chalan_Regsiter", value.Reports__SalesAndPurchase__Sales__Chalan_Regsiter);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter", value.Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Sales_Quotation_Register", value.Reports__SalesAndPurchase__Sales__Sales_Quotation_Register);
            parameters.Add("@Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register", value.Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Detail_Register", value.Reports__SalesAndPurchase__Purchase__Detail_Register);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Summary_Register", value.Reports__SalesAndPurchase__Purchase__Summary_Register);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Item_Wise_Register", value.Reports__SalesAndPurchase__Purchase__Item_Wise_Register);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Monthly_Register", value.Reports__SalesAndPurchase__Purchase__Monthly_Register);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Chalan_Regsiter", value.Reports__SalesAndPurchase__Purchase__Chalan_Regsiter);
            parameters.Add("@Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter", value.Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Sales", value.Reports__SalesAndPurchase__Outstanding__Sales);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger", value.Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Purchase", value.Reports__SalesAndPurchase__Outstanding__Purchase);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger", value.Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Aiging_Register", value.Reports__SalesAndPurchase__Outstanding__Aiging_Register);
            parameters.Add("@Reports__SalesAndPurchase__Outstanding__Interest_Calculator", value.Reports__SalesAndPurchase__Outstanding__Interest_Calculator);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__LR_Register", value.Reports__BookAndRegister__LR_Booking_Register__LR_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Stock_Register", value.Reports__BookAndRegister__LR_Booking_Register__Stock_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Booking_Register", value.Reports__BookAndRegister__LR_Booking_Register__Booking_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Daily_Summary", value.Reports__BookAndRegister__LR_Booking_Register__Daily_Summary);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary", value.Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report", value.Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report);
            parameters.Add("@Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report", value.Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__LR_Register", value.Reports__BookAndRegister__LR_Delivery_Register__LR_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Stock_Register", value.Reports__BookAndRegister__LR_Delivery_Register__Stock_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register", value.Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary", value.Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary", value.Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report", value.Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report);
            parameters.Add("@Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report", value.Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report);
            parameters.Add("@Reports__BookAndRegister__Bank_Book", value.Reports__BookAndRegister__Bank_Book);
            parameters.Add("@Reports__BookAndRegister__Cash_Book", value.Reports__BookAndRegister__Cash_Book);
            parameters.Add("@Reports__BookAndRegister__Journal_Book", value.Reports__BookAndRegister__Journal_Book);
            parameters.Add("@Reports__BookAndRegister__Day_Book", value.Reports__BookAndRegister__Day_Book);
            parameters.Add("@Reports__BookAndRegister__Voucher_Book", value.Reports__BookAndRegister__Voucher_Book);
            parameters.Add("@Reports__BookAndRegister__TDSAndTCS_Register", value.Reports__BookAndRegister__TDSAndTCS_Register);
            parameters.Add("@Reports__BookAndRegister__Credit_Debit_Note_Register", value.Reports__BookAndRegister__Credit_Debit_Note_Register);
            parameters.Add("@Reports__BookAndRegister__Payroll_Register", value.Reports__BookAndRegister__Payroll_Register);
            parameters.Add("@Reports__BookAndRegister__Brokrage_Register", value.Reports__BookAndRegister__Brokrage_Register);
            parameters.Add("@Reports__Stock__Stock_In_Out_Detail", value.Reports__Stock__Stock_In_Out_Detail);
            parameters.Add("@Reports__Stock__Stock_Statement", value.Reports__Stock__Stock_Statement);
            parameters.Add("@Reports__Stock__Item_Wise", value.Reports__Stock__Item_Wise);
            parameters.Add("@Reports__Stock__Group_Wise", value.Reports__Stock__Group_Wise);
            parameters.Add("@Reports__Stock__Stock_In_Process", value.Reports__Stock__Stock_In_Process);
            parameters.Add("@Reports__Stock__Stock_In_Ware_House", value.Reports__Stock__Stock_In_Ware_House);
            parameters.Add("@Reports__ProdAndInventory__Prod_Register__Yarn", value.Reports__ProdAndInventory__Prod_Register__Yarn);
            parameters.Add("@Reports__ProdAndInventory__Prod_Register__Beam", value.Reports__ProdAndInventory__Prod_Register__Beam);
            parameters.Add("@Reports__ProdAndInventory__Prod_Register__Grey", value.Reports__ProdAndInventory__Prod_Register__Grey);
            parameters.Add("@Reports__ProdAndInventory__Prod_Register__General", value.Reports__ProdAndInventory__Prod_Register__General);
            parameters.Add("@Reports__ProdAndInventory__Batch_Master_Register", value.Reports__ProdAndInventory__Batch_Master_Register);
            parameters.Add("@Reports__ProdAndInventory__Issue_Register", value.Reports__ProdAndInventory__Issue_Register);
            parameters.Add("@Reports__ProdAndInventory__Receive_Register", value.Reports__ProdAndInventory__Receive_Register);
            parameters.Add("@Reports__Jobwork__Work_Issue_Chalan_Reg", value.Reports__Jobwork__Work_Issue_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Work_Receive_Chalan_Reg", value.Reports__Jobwork__Work_Receive_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Work_Pending_Reg", value.Reports__Jobwork__Work_Pending_Reg);
            parameters.Add("@Reports__Jobwork__Jobwork_Receive_Chalan_Reg", value.Reports__Jobwork__Jobwork_Receive_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Jobwork_Issue_Chalan_Reg", value.Reports__Jobwork__Jobwork_Issue_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Jobwork_Pending_Reg", value.Reports__Jobwork__Jobwork_Pending_Reg);
            parameters.Add("@Reports__Jobwork__Mill_Issue_Chalan_Reg", value.Reports__Jobwork__Mill_Issue_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Mill_Receive_Chalan_Reg", value.Reports__Jobwork__Mill_Receive_Chalan_Reg);
            parameters.Add("@Reports__Jobwork__Mill_Pending_Reg", value.Reports__Jobwork__Mill_Pending_Reg);
            parameters.Add("@Reports__GST_Register__GSTR_01", value.Reports__GST_Register__GSTR_01);
            parameters.Add("@Reports__GST_Register__GSTR_02_2A_2B", value.Reports__GST_Register__GSTR_02_2A_2B);
            parameters.Add("@Reports__GST_Register__GSTR_03B", value.Reports__GST_Register__GSTR_03B);
            parameters.Add("@Reports__GST_Register__GSTR_04_4B", value.Reports__GST_Register__GSTR_04_4B);
            parameters.Add("@Reports__GST_Register__GSTR_09_9C", value.Reports__GST_Register__GSTR_09_9C);
            parameters.Add("@Reports__GST_Register__ITC_04", value.Reports__GST_Register__ITC_04);
            parameters.Add("@Reports__GST_Register__GSTR_SetOff", value.Reports__GST_Register__GSTR_SetOff);
            parameters.Add("@Reports__GST_Register__GSTR_Reconsilation", value.Reports__GST_Register__GSTR_Reconsilation);
            parameters.Add("@Reports__Account_Register__Ledger_Head_Print", value.Reports__Account_Register__Ledger_Head_Print);
            parameters.Add("@Reports__Account_Register__Leadger", value.Reports__Account_Register__Leadger);
            parameters.Add("@Reports__Account_Register__Ledger_Multi", value.Reports__Account_Register__Ledger_Multi);
            parameters.Add("@Reports__Account_Register__Ledger_Month_Wise", value.Reports__Account_Register__Ledger_Month_Wise);
            parameters.Add("@Reports__Account_Register__Interest_Calculator", value.Reports__Account_Register__Interest_Calculator);
            parameters.Add("@Reports__Account_Register__Payable_Receivable", value.Reports__Account_Register__Payable_Receivable);
            parameters.Add("@Reports__Financial_Reports__Trial_Balance_Summary", value.Reports__Financial_Reports__Trial_Balance_Summary);
            parameters.Add("@Reports__Financial_Reports__Trial_Balance_Detail", value.Reports__Financial_Reports__Trial_Balance_Detail);
            parameters.Add("@Reports__Financial_Reports__Trading_Account", value.Reports__Financial_Reports__Trading_Account);
            parameters.Add("@Reports__Financial_Reports__ProfitAndLoss", value.Reports__Financial_Reports__ProfitAndLoss);
            parameters.Add("@Reports__Financial_Reports__Balance_Sheet", value.Reports__Financial_Reports__Balance_Sheet);
            parameters.Add("@Reports__Financial_Reports__Balance_Sheet_Schedule", value.Reports__Financial_Reports__Balance_Sheet_Schedule);
            parameters.Add("@Inventory__Production__Consumption_BOM__Batch_Master", value.Inventory__Production__Consumption_BOM__Batch_Master);
            parameters.Add("@Inventory__Production__Consumption_BOM__Yarn_Master", value.Inventory__Production__Consumption_BOM__Yarn_Master);
            parameters.Add("@Inventory__Production__Consumption_BOM__Grey_Master", value.Inventory__Production__Consumption_BOM__Grey_Master);
            parameters.Add("@Inventory__Production__Consumption_BOM__Saree_Master", value.Inventory__Production__Consumption_BOM__Saree_Master);
            parameters.Add("@Inventory__Production__Gen_Prod__Production", value.Inventory__Production__Gen_Prod__Production);
            parameters.Add("@Inventory__Production__Gen_Prod__Yarn_Production", value.Inventory__Production__Gen_Prod__Yarn_Production);
            parameters.Add("@Inventory__Production__Gen_Prod__Beam_Production", value.Inventory__Production__Gen_Prod__Beam_Production);
            parameters.Add("@Inventory__Production__Gen_Prod__Grey_Production", value.Inventory__Production__Gen_Prod__Grey_Production);
            parameters.Add("@Inventory__Production__Gen_Prod__Saree_Production", value.Inventory__Production__Gen_Prod__Saree_Production);
            parameters.Add("@Inventory__IssueAndReceive__Yarn__Issue", value.Inventory__IssueAndReceive__Yarn__Issue);
            parameters.Add("@Inventory__IssueAndReceive__Yarn__Receive", value.Inventory__IssueAndReceive__Yarn__Receive);
            parameters.Add("@Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork", value.Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork);
            parameters.Add("@Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue", value.Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue);
            parameters.Add("@Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork", value.Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork);
            parameters.Add("@Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork", value.Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork);
            parameters.Add("@Inventory__Beam_Entry", value.Inventory__Beam_Entry);
            parameters.Add("@Inventory__Inventory__Issue", value.Inventory__Inventory__Issue);
            parameters.Add("@Inventory__Inventory__Receive", value.Inventory__Inventory__Receive);
            parameters.Add("@Inventory__Jobwork__Work_Dispach", value.Inventory__Jobwork__Work_Dispach);
            parameters.Add("@Inventory__Jobwork__Work_Receive", value.Inventory__Jobwork__Work_Receive);
            parameters.Add("@Inventory__Jobwork__Job_Receive", value.Inventory__Jobwork__Job_Receive);
            parameters.Add("@Inventory__Jobwork__Job_Issue", value.Inventory__Jobwork__Job_Issue);
            parameters.Add("@Inventory__Mill_Jobwork__Issue", value.Inventory__Mill_Jobwork__Issue);
            parameters.Add("@Inventory__Mill_Jobwork__Receive", value.Inventory__Mill_Jobwork__Receive);
            parameters.Add("@Inventory__Mill_Jobwork__Job_Receive", value.Inventory__Mill_Jobwork__Job_Receive);
            parameters.Add("@Inventory__Mill_Jobwork__Job_Issue", value.Inventory__Mill_Jobwork__Job_Issue);
            parameters.Add("@Inventory__Cutting_Process__Taka_to_Pcs", value.Inventory__Cutting_Process__Taka_to_Pcs);
            parameters.Add("@SettingsAndUtilities__Book_Setting__Books", value.SettingsAndUtilities__Book_Setting__Books);
            parameters.Add("@SettingsAndUtilities__Book_Setting__Multi_Print_Invoice", value.SettingsAndUtilities__Book_Setting__Multi_Print_Invoice);
            parameters.Add("@SettingsAndUtilities__Book_Setting__Multi_Print_Vocher", value.SettingsAndUtilities__Book_Setting__Multi_Print_Vocher);
            parameters.Add("@SettingsAndUtilities__Merge__Account_Master", value.SettingsAndUtilities__Merge__Account_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Product_Master", value.SettingsAndUtilities__Merge__Product_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Broker_Master", value.SettingsAndUtilities__Merge__Broker_Master);
            parameters.Add("@SettingsAndUtilities__Merge__City_Master", value.SettingsAndUtilities__Merge__City_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Vehicle_Master", value.SettingsAndUtilities__Merge__Vehicle_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Driver_Master", value.SettingsAndUtilities__Merge__Driver_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Packing_Master", value.SettingsAndUtilities__Merge__Packing_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Description_Master", value.SettingsAndUtilities__Merge__Description_Master);
            parameters.Add("@SettingsAndUtilities__Merge__Taka_Merge", value.SettingsAndUtilities__Merge__Taka_Merge);
            parameters.Add("@SettingsAndUtilities__Merge__Taka_Demerge", value.SettingsAndUtilities__Merge__Taka_Demerge);
            parameters.Add("@SettingsAndUtilities__Year__Create_New_Year", value.SettingsAndUtilities__Year__Create_New_Year);
            parameters.Add("@SettingsAndUtilities__Year__Year_End_Process", value.SettingsAndUtilities__Year__Year_End_Process);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Closing_Stock", value.SettingsAndUtilities__Transfer_Next_Year__Closing_Stock);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Closing_Amount", value.SettingsAndUtilities__Transfer_Next_Year__Closing_Amount);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice", value.SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice", value.SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job", value.SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work", value.SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Mill_Issue", value.SettingsAndUtilities__Transfer_Next_Year__Mill_Issue);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive", value.SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Taka_Production", value.SettingsAndUtilities__Transfer_Next_Year__Taka_Production);
            parameters.Add("@SettingsAndUtilities__Transfer_Next_Year__Box_Production", value.SettingsAndUtilities__Transfer_Next_Year__Box_Production);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Closing_Stock", value.SettingsAndUtilities__Delete_Previous_Year__Closing_Stock);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Closing_Amount", value.SettingsAndUtilities__Delete_Previous_Year__Closing_Amount);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice", value.SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice", value.SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job", value.SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work", value.SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Mill_Issue", value.SettingsAndUtilities__Delete_Previous_Year__Mill_Issue);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive", value.SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Taka_Production", value.SettingsAndUtilities__Delete_Previous_Year__Taka_Production);
            parameters.Add("@SettingsAndUtilities__Delete_Previous_Year__Box_Production", value.SettingsAndUtilities__Delete_Previous_Year__Box_Production);
            parameters.Add("@SettingsAndUtilities__Transport_Setting__Firm", value.SettingsAndUtilities__Transport_Setting__Firm);
            parameters.Add("@SettingsAndUtilities__Transport_Setting__Branch", value.SettingsAndUtilities__Transport_Setting__Branch);
            parameters.Add("@SettingsAndUtilities__Transport_Setting__LR_Rate", value.SettingsAndUtilities__Transport_Setting__LR_Rate);
            parameters.Add("@SettingsAndUtilities__Transport_Setting__Contract_Rate", value.SettingsAndUtilities__Transport_Setting__Contract_Rate);
            parameters.Add("@SettingsAndUtilities__Transport_Setting__LR_Booking_Range", value.SettingsAndUtilities__Transport_Setting__LR_Booking_Range);
            parameters.Add("@UserId", value.UserId);

            return QueryHelper.Save("sp_MenuSettingsSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_MenuSettingDelete", connectionString, parameters);
        }
        public MenuSettingViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet", connectionString, parameters);
        }
        public MenuSettingViewModel GetBySoftware(int softwareId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@SoftwareId", softwareId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_BySoftware", connectionString, parameters);
        }
        public MenuSettingViewModel GetBySoftwarePlan(int softwarePlanId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@SoftwarePlanId", softwarePlanId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_BySoftwarePlan", connectionString, parameters);
        }
        public MenuSettingViewModel GetByCustomer(int customerId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerId", customerId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_ByCustomer", connectionString, parameters);
        }
        public MenuSettingViewModel GetByFirm(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CusomerFirmId", firmId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_ByCustomerFirm", connectionString, parameters);
        }
        public MenuSettingViewModel GetByBranch(int branchId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerFirmBranchId", branchId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_ByCustomerFirmBranch", connectionString, parameters);
        }
        public MenuSettingViewModel GetByUser(int branchId, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerFirmBranchId", branchId);
            parameters.Add("@CustomerUserId", userId);
            return QueryHelper.Get<MenuSettingViewModel>("sp_MenuSettingsGet_ByCustomerUser", connectionString, parameters);
        }
        public List<MenuSettingGridViewModel> List(string connectionString, int loginId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<MenuSettingGridViewModel>("sp_MenuSettingList", connectionString, param);
        }
    }
}
