ALTER TABLE CustomerUser Add AllowUpdateUserMenuSettingToCustomer BIT NOT NULL DEFAULT(0)
GO

CREATE TABLE [dbo].[CustomerFirmBranchMenuSetting](
	[CustomerFirmBranchId] [int] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerFirmBranchMenuSetting] PRIMARY KEY CLUSTERED 
(
	[CustomerFirmBranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CustomerFirmMenuSetting](
	[CustomerFirmId] [int] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerFirmMenuSetting] PRIMARY KEY CLUSTERED 
(
	[CustomerFirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CustomerMenuSetting](
	[CustomerId] [int] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerMenuSetting] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CustomerUserMenuSetting](
	[CustomerUserId] [int] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerUserMenuSetting] PRIMARY KEY CLUSTERED 
(
	[CustomerUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SoftwareMenuSetting](
	[SoftwareId] [tinyint] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_SoftwareMenuSetting] PRIMARY KEY CLUSTERED 
(
	[SoftwareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SoftwarePlanMenuSetting](
	[SoftwarePlanId] [tinyint] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
 CONSTRAINT [PK_SoftwarePlanMenuSetting] PRIMARY KEY CLUSTERED 
(
	[SoftwarePlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[CustomerMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Firms]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Branches]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Customer__Users]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Add]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Add]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Design]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Colour]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Size]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Fabric]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Shade]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Product__Packing]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Broker]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Machine]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Shade]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Process]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Cataloge]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Employee]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__City]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Vehicles]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__Drivers]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Packing]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Master__LR__Description]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__LR]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Credit_Note]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Transaction__Debit_Note]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Reconsilation]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] ADD  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchMenuSetting_CustomerFirmBranch] FOREIGN KEY([CustomerFirmBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
ALTER TABLE [dbo].[CustomerFirmBranchMenuSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchMenuSetting_CustomerFirmBranch]
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmMenuSetting_CustomerFirm] FOREIGN KEY([CustomerFirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO
ALTER TABLE [dbo].[CustomerFirmMenuSetting] CHECK CONSTRAINT [FK_CustomerFirmMenuSetting_CustomerFirm]
GO
ALTER TABLE [dbo].[CustomerMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerMenuSetting_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerMenuSetting] CHECK CONSTRAINT [FK_CustomerMenuSetting_Customer]
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerUserMenuSetting_CustomerUser] FOREIGN KEY([CustomerUserId])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
ALTER TABLE [dbo].[CustomerUserMenuSetting] CHECK CONSTRAINT [FK_CustomerUserMenuSetting_CustomerUser]
GO
ALTER TABLE [dbo].[SoftwareMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareMenuSetting_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
ALTER TABLE [dbo].[SoftwareMenuSetting] CHECK CONSTRAINT [FK_SoftwareMenuSetting_Software]
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_SoftwarePlanMenuSetting_SoftwarePlan] FOREIGN KEY([SoftwarePlanId])
REFERENCES [dbo].[SoftwarePlan] ([Id])
GO
ALTER TABLE [dbo].[SoftwarePlanMenuSetting] CHECK CONSTRAINT [FK_SoftwarePlanMenuSetting_SoftwarePlan]
GO
