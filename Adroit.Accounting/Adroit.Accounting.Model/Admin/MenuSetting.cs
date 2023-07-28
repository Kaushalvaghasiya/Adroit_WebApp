//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class MenuSetting
    {
        public int Id { get; set; }
        public byte SoftwareId { get; set; }
        public byte SoftwarePlanId { get; set; }
        public int CustomerId { get; set; }
        public int CusomerFirmId { get; set; }
        public int CustomerFirmBranchId { get; set; }
        public int CustomerUserId { get; set; }
        public bool Master__Adroit__Software__Software_Master { get; set; }
        public bool Master__Adroit__Software__Plan { get; set; }
        public bool Master__Adroit__Software__Businesses { get; set; }
        public bool Master__Adroit__Customer__Customers { get; set; }
        public bool Master__Adroit__Customer__Branch_Types { get; set; }
        public bool Master__Adroit__Customer__Menu_Setting { get; set; }
        public bool Master__Adroit__Customer__Box_Setting { get; set; }
        public bool Master__Adroit__Account__Accounts { get; set; }
        public bool Master__Adroit__Account__Secondary_Account_Group { get; set; }
        public bool Master__Adroit__Account__Primary_Account_Group { get; set; }
        public bool Master__Adroit__Account__Books { get; set; }
        public bool Master__Adroit__Account__Book_Types { get; set; }
        public bool Master__Adroit__Account__Bill_From { get; set; }
        public bool Master__Adroit__Account__Book_Settings { get; set; }
        public bool Master__Adroit__Location__City { get; set; }
        public bool Master__Adroit__Location__Taluka { get; set; }
        public bool Master__Adroit__Location__District { get; set; }
        public bool Master__Adroit__Location__State { get; set; }
        public bool Master__Adroit__Location__Country { get; set; }
        public bool Master__Adroit__GST__Rate { get; set; }
        public bool Master__Adroit__GST__Invoice_Types { get; set; }
        public bool Master__Adroit__GST__Ports { get; set; }
        public bool Master__Adroit__GST__Collections { get; set; }
        public bool Master__Adroit__Product__Colour { get; set; }
        public bool Master__Adroit__Product__Amount_Calculations { get; set; }
        public bool Master__Adroit__Product__Size { get; set; }
        public bool Master__Adroit__Product__Stock_Types { get; set; }
        public bool Master__Adroit__Product__Quality_Types { get; set; }
        public bool Master__Adroit__Transport__Packing { get; set; }
        public bool Master__Adroit__Transport__Description { get; set; }
        public bool Master__Adroit__Transport__LR_Charges { get; set; }
        public bool Master__Customer__Firms { get; set; }
        public bool Master__Customer__Branches { get; set; }
        public bool Master__Customer__Users { get; set; }
        public bool Master__Account__Add { get; set; }
        public bool Master__Account__Secondary_Account_Group { get; set; }
        public bool Master__Account__Primary_Account_Group { get; set; }
        public bool Master__Product__Add { get; set; }
        public bool Master__Product__Design { get; set; }
        public bool Master__Product__Colour { get; set; }
        public bool Master__Product__Size { get; set; }
        public bool Master__Product__Fabric { get; set; }
        public bool Master__Product__Group { get; set; }
        public bool Master__Product__Sub_Group { get; set; }
        public bool Master__Product__Shade { get; set; }
        public bool Master__Product__Packing { get; set; }
        public bool Master__Broker { get; set; }
        public bool Master__Machine { get; set; }
        public bool Master__Yarn_Shade { get; set; }
        public bool Master__Yarn_Recipes { get; set; }
        public bool Master__Process { get; set; }
        public bool Master__Cataloge { get; set; }
        public bool Master__Employee { get; set; }
        public bool Master__Location__City { get; set; }
        public bool Master__Location__Branch_City_Mapping { get; set; }
        public bool Master__Vehicles { get; set; }
        public bool Master__Drivers { get; set; }
        public bool Master__LR__Packing { get; set; }
        public bool Master__LR__Description { get; set; }
        public bool Transaction__Booking__LR { get; set; }
        public bool Transaction__Booking__Chalan { get; set; }
        public bool Transaction__Booking__Invoice { get; set; }
        public bool Transaction__Delivery__Chalan_Receive { get; set; }
        public bool Transaction__Delivery__Delivery_Invoice { get; set; }
        public bool Transaction__Sales__Quotation { get; set; }
        public bool Transaction__Sales__Praforma_Invoice { get; set; }
        public bool Transaction__Sales__Sales_Order { get; set; }
        public bool Transaction__Sales__Chalan_Packing_Slip { get; set; }
        public bool Transaction__Sales__Sales { get; set; }
        public bool Transaction__Sales__Sales_Return { get; set; }
        public bool Transaction__Purchase__Purchase_Order { get; set; }
        public bool Transaction__Purchase__Purchase_Chalan { get; set; }
        public bool Transaction__Purchase__Purchase { get; set; }
        public bool Transaction__Purchase__Jobwork_Purchase { get; set; }
        public bool Transaction__Purchase__Purchase_Return { get; set; }
        public bool Transaction__Purchase__General_Expenses { get; set; }
        public bool Transaction__Purchase__General_Expenses_Multi { get; set; }
        public bool Transaction__Credit_Note { get; set; }
        public bool Transaction__Debit_Note { get; set; }
        public bool Account__Payment__Bank_Payment { get; set; }
        public bool Account__Payment__Cash_Payment { get; set; }
        public bool Account__Receive__Bank_Receive { get; set; }
        public bool Account__Receive__Cash_Receive { get; set; }
        public bool Account__Account_Opening_Balance { get; set; }
        public bool Account__Product_Opening_Stock { get; set; }
        public bool Account__Journal_JV__General_JV { get; set; }
        public bool Account__Journal_JV__Bill_Base_JV { get; set; }
        public bool Account__GST_Filling__GSTR_01 { get; set; }
        public bool Account__GST_Filling__GSTR_02_2A_2B { get; set; }
        public bool Account__GST_Filling__GSTR_03B { get; set; }
        public bool Account__GST_Filling__GSTR_04_4B { get; set; }
        public bool Account__GST_Filling__GSTR_09_9C { get; set; }
        public bool Account__GST_Filling__ITC_04 { get; set; }
        public bool Account__Reconsilation { get; set; }
        public bool Account__Cash_Auto_Payment { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Detail_Register { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Summary_Register { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Item_Wise_Register { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Monthly_Register { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Chalan_Regsiter { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Sales_Quotation_Register { get; set; }
        public bool Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Detail_Register { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Summary_Register { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Item_Wise_Register { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Monthly_Register { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Chalan_Regsiter { get; set; }
        public bool Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Sales { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Purchase { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Aiging_Register { get; set; }
        public bool Reports__SalesAndPurchase__Outstanding__Interest_Calculator { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__LR_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Stock_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Booking_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Daily_Summary { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report { get; set; }
        public bool Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__LR_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Stock_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report { get; set; }
        public bool Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report { get; set; }
        public bool Reports__BookAndRegister__Bank_Book { get; set; }
        public bool Reports__BookAndRegister__Cash_Book { get; set; }
        public bool Reports__BookAndRegister__Journal_Book { get; set; }
        public bool Reports__BookAndRegister__Day_Book { get; set; }
        public bool Reports__BookAndRegister__Voucher_Book { get; set; }
        public bool Reports__BookAndRegister__TDSAndTCS_Register { get; set; }
        public bool Reports__BookAndRegister__Credit_Debit_Note_Register { get; set; }
        public bool Reports__BookAndRegister__Payroll_Register { get; set; }
        public bool Reports__BookAndRegister__Brokrage_Register { get; set; }
        public bool Reports__Stock__Stock_In_Out_Detail { get; set; }
        public bool Reports__Stock__Stock_Statement { get; set; }
        public bool Reports__Stock__Item_Wise { get; set; }
        public bool Reports__Stock__Group_Wise { get; set; }
        public bool Reports__Stock__Stock_In_Process { get; set; }
        public bool Reports__Stock__Stock_In_Ware_House { get; set; }
        public bool Reports__ProdAndInventory__Prod_Register__Yarn { get; set; }
        public bool Reports__ProdAndInventory__Prod_Register__Beam { get; set; }
        public bool Reports__ProdAndInventory__Prod_Register__Grey { get; set; }
        public bool Reports__ProdAndInventory__Prod_Register__General { get; set; }
        public bool Reports__ProdAndInventory__Batch_Master_Register { get; set; }
        public bool Reports__ProdAndInventory__Issue_Register { get; set; }
        public bool Reports__ProdAndInventory__Receive_Register { get; set; }
        public bool Reports__Jobwork__Work_Issue_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Work_Receive_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Work_Pending_Reg { get; set; }
        public bool Reports__Jobwork__Jobwork_Receive_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Jobwork_Issue_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Jobwork_Pending_Reg { get; set; }
        public bool Reports__Jobwork__Mill_Issue_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Mill_Receive_Chalan_Reg { get; set; }
        public bool Reports__Jobwork__Mill_Pending_Reg { get; set; }
        public bool Reports__GST_Register__GSTR_01 { get; set; }
        public bool Reports__GST_Register__GSTR_02_2A_2B { get; set; }
        public bool Reports__GST_Register__GSTR_03B { get; set; }
        public bool Reports__GST_Register__GSTR_04_4B { get; set; }
        public bool Reports__GST_Register__GSTR_09_9C { get; set; }
        public bool Reports__GST_Register__ITC_04 { get; set; }
        public bool Reports__GST_Register__GSTR_SetOff { get; set; }
        public bool Reports__GST_Register__GSTR_Reconsilation { get; set; }
        public bool Reports__Account_Register__Ledger_Head_Print { get; set; }
        public bool Reports__Account_Register__Leadger { get; set; }
        public bool Reports__Account_Register__Ledger_Multi { get; set; }
        public bool Reports__Account_Register__Ledger_Month_Wise { get; set; }
        public bool Reports__Account_Register__Interest_Calculator { get; set; }
        public bool Reports__Account_Register__Payable_Receivable { get; set; }
        public bool Reports__Financial_Reports__Trial_Balance_Summary { get; set; }
        public bool Reports__Financial_Reports__Trial_Balance_Detail { get; set; }
        public bool Reports__Financial_Reports__Trading_Account { get; set; }
        public bool Reports__Financial_Reports__ProfitAndLoss { get; set; }
        public bool Reports__Financial_Reports__Balance_Sheet { get; set; }
        public bool Reports__Financial_Reports__Balance_Sheet_Schedule { get; set; }
        public bool Inventory__Production__Consumption_BOM__Batch_Master { get; set; }
        public bool Inventory__Production__Consumption_BOM__Yarn_Master { get; set; }
        public bool Inventory__Production__Consumption_BOM__Grey_Master { get; set; }
        public bool Inventory__Production__Consumption_BOM__Saree_Master { get; set; }
        public bool Inventory__Production__Gen_Prod__Production { get; set; }
        public bool Inventory__Production__Gen_Prod__Yarn_Production { get; set; }
        public bool Inventory__Production__Gen_Prod__Beam_Production { get; set; }
        public bool Inventory__Production__Gen_Prod__Grey_Production { get; set; }
        public bool Inventory__Production__Gen_Prod__Saree_Production { get; set; }
        public bool Inventory__IssueAndReceive__Yarn__Issue { get; set; }
        public bool Inventory__IssueAndReceive__Yarn__Receive { get; set; }
        public bool Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork { get; set; }
        public bool Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue { get; set; }
        public bool Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork { get; set; }
        public bool Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork { get; set; }
        public bool Inventory__Beam_Entry { get; set; }
        public bool Inventory__Inventory__Issue { get; set; }
        public bool Inventory__Inventory__Receive { get; set; }
        public bool Inventory__Jobwork__Work_Dispach { get; set; }
        public bool Inventory__Jobwork__Work_Receive { get; set; }
        public bool Inventory__Jobwork__Job_Receive { get; set; }
        public bool Inventory__Jobwork__Job_Issue { get; set; }
        public bool Inventory__Mill_Jobwork__Issue { get; set; }
        public bool Inventory__Mill_Jobwork__Receive { get; set; }
        public bool Inventory__Mill_Jobwork__Job_Receive { get; set; }
        public bool Inventory__Mill_Jobwork__Job_Issue { get; set; }
        public bool Inventory__Cutting_Process__Taka_to_Pcs { get; set; }
        public bool SettingsAndUtilities__Book_Setting__Books { get; set; }
        public bool SettingsAndUtilities__Book_Setting__Multi_Print_Invoice { get; set; }
        public bool SettingsAndUtilities__Book_Setting__Multi_Print_Vocher { get; set; }
        public bool SettingsAndUtilities__Merge__Account_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Product_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Broker_Master { get; set; }
        public bool SettingsAndUtilities__Merge__City_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Vehicle_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Driver_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Packing_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Description_Master { get; set; }
        public bool SettingsAndUtilities__Merge__Taka_Merge { get; set; }
        public bool SettingsAndUtilities__Merge__Taka_Demerge { get; set; }
        public bool SettingsAndUtilities__Year__Create_New_Year { get; set; }
        public bool SettingsAndUtilities__Year__Year_End_Process { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Closing_Stock { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Closing_Amount { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Mill_Issue { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Taka_Production { get; set; }
        public bool SettingsAndUtilities__Transfer_Next_Year__Box_Production { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Closing_Stock { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Closing_Amount { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Mill_Issue { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Taka_Production { get; set; }
        public bool SettingsAndUtilities__Delete_Previous_Year__Box_Production { get; set; }
        public bool SettingsAndUtilities__Transport_Setting__Firm { get; set; }
        public bool SettingsAndUtilities__Transport_Setting__Branch { get; set; }
        public bool SettingsAndUtilities__Transport_Setting__LR_Rate { get; set; }
        public bool SettingsAndUtilities__Transport_Setting__Contract_Rate { get; set; }
        public bool SettingsAndUtilities__Transport_Setting__LR_Booking_Range { get; set; }
        public int UserId { get; set; }
    }
}
