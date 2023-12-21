CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveGetGridDetailsByChalanNumber]
  @LoginId int,
  @BranchId int,
  @ChalanNumber int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT [Z-PurchaseBillMaster-Z].Id 
	,[Z-PurchaseBillMaster-Z].BillDate 
	,CT1.Title AS CityFrom
	,CT2.Title AS CityTo
	,Vehilcle.VRN AS VehilcleNumber
	,[CustomerAccount].Name AS BillParty
	,Driver.Name AS DriverName
	,[Z-PurchaseBillMaster-Z].EwayBillNumber AS EwayBillNumber
	,[Z-PurchaseBillMaster-Z].TaxableAmount AS TaxableAmount
	,[Z-PurchaseBillMaster-Z].TDSAmount AS TDSAmount	
	,[Z-PurchaseBillMaster-Z].AdvanceCash AS AdvanceCash	
	,[Z-PurchaseBillMaster-Z].AdvanceNeft AS AdvanceNeft	
	,[Z-PurchaseBillMaster-Z].ReceiveCash AS ReceiveCash	
	,[Z-PurchaseBillMaster-Z].OtherPlus AS OtherPlus	
	,[Z-PurchaseBillMaster-Z].OtherLess AS OtherLess	
	,[Broker].Name AS BrokerName
	,[Z-PurchaseBillMaster-Z].BrokerAmount AS BrokerAmount
	,[Z-PurchaseBillMaster-Z].Notes AS Remarks
	,[Z-PurchaseBillMaster-Z].ToPayAmount AS ToPayAmount
	,[Z-PurchaseBillMaster-Z].CrossingAmount AS CrossingAmount
	,[Z-PurchaseBillMaster-Z].CrossingCommission AS CrossingCommission
	,[Z-PurchaseBillMaster-Z].CrossingHamali AS CrossingHamali
	,[Z-PurchaseBillMaster-Z].CrossingDeliveryCharge AS CrossingDeliveryCharge
	,CA4.Name As ToPayAccount
	,CA5.Name As CrossingAmountAccount
	,CA6.Name As CrossingCommissionAccount
	,CA7.Name As CrossingHamaliAccount
	,CA8.Name As CrossingDeliveryChargeAccount
	,ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
	(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0)) + 
	(ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0)) AS NetAmount
	,[Z-PurchaseBillDetail-Z].Id AS LRBookingId
	,[Z-PurchaseBillDetail-Z].LRBookingId AS LRNumber
	,[Z-LRBooking-Z].LRDate AS LRDate 
	,[Z-LRBooking-Z].PrivateMarka AS PrivateMarka
	,[Z-LRBooking-Z].Parcel AS Packing
	,[Z-LRBooking-Z].ChargeWeight AS ChargeWeight
	,[Z-LRBooking-Z].CityIdTo AS CityIdTo
	,[Z-LRBooking-Z].CityIdFrom AS CityIdFrom
	,(ISNULL([Z-LRBooking-Z].[Freight],0)+ISNULL([Z-LRBooking-Z].[Charges1],0)+ISNULL([Z-LRBooking-Z].[Charges2],0)+ISNULL([Z-LRBooking-Z].[Charges3],0)+ISNULL([Z-LRBooking-Z].[Charges4],0)+ISNULL([Z-LRBooking-Z].[Charges5],0)+ISNULL([Z-LRBooking-Z].[Charges6],0)) AS ChargeAmount
	,[TransportDesc].[Title] AS Description
	,CA1.Name As Consignor
	,CA2.Name As Consignee
	,CA3.Name As BillPartyName
	FROM [Z-PurchaseBillMaster-Z]
	LEFT JOIN [Z-PurchaseBillDetail-Z] on [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = [Z-PurchaseBillMaster-Z].Id AND [Z-PurchaseBillDetail-Z].Deleted = 0 
	LEFT JOIN [Z-LRBooking-Z] on [Z-LRBooking-Z].Id = [Z-PurchaseBillDetail-Z].LRBookingId AND [Z-LRBooking-Z].Deleted = 0 AND [Z-LRBooking-Z].BranchId = @BranchId
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId AND CAB1.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId AND CAB2.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.Deleted = 0 AND CA2.Active = 1
	LEFT JOIN Vehilcle on Vehilcle.Id = [Z-PurchaseBillMaster-Z].VehicleId AND Vehilcle.CustomerId = @CustomerId AND Vehilcle.Active = 1 AND Vehilcle.Deleted = 0 
	LEFT JOIN [CustomerAccountBranchMapping] ON [Z-PurchaseBillMaster-Z].[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] AND [CustomerAccountBranchMapping].[BranchId] = @BranchId AND [CustomerAccountBranchMapping].Deleted = 0
	LEFT JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId AND [CustomerAccount].Active = 1 AND [CustomerAccount].Deleted = 0
	LEFT JOIN [CustomerBrokerBranchMapping] ON [Z-PurchaseBillMaster-Z].[BrokerBranchMappingId] = [CustomerBrokerBranchMapping].[Id] AND [CustomerBrokerBranchMapping].[BranchId] = @BranchId AND [CustomerBrokerBranchMapping].Deleted = 0
	LEFT JOIN [Broker] ON [CustomerBrokerBranchMapping].[BrokerId] = [Broker].[Id] AND [Broker].[CustomerId] = @CustomerId AND [Broker].Active = 1 AND [Broker].Deleted = 0
	LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN City CT1 on CT1.Id = [Z-PurchaseBillMaster-Z].CityIdFrom AND CT1.Active = 1 
	LEFT JOIN City CT2 on CT2.Id = [Z-PurchaseBillMaster-Z].CityIdFrom AND CT2.Active = 1 
	LEFT JOIN Driver on Driver.Id = [Z-PurchaseBillMaster-Z].DriverId AND Driver.CustomerId = @CustomerId AND Driver.Active = 1 AND Driver.Deleted = 0 
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId AND CAB3.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.Deleted = 0 AND CA3.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB4 on CAB4.Id = [Z-PurchaseBillMaster-Z].ToPayAccountBranchMappingId AND CAB4.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId AND CA4.Deleted = 0 AND CA4.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB5 on CAB5.Id = [Z-PurchaseBillMaster-Z].CrossingAmountAccountBranchMappingId AND CAB5.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId AND CA5.Deleted = 0 AND CA5.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB6 on CAB6.Id = [Z-PurchaseBillMaster-Z].CrossingCommissionAccountBranchMappingId AND CAB6.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA6 on CA6.Id = CAB6.AccountId AND CA6.Deleted = 0 AND CA6.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB7 on CAB7.Id = [Z-PurchaseBillMaster-Z].CrossingHamaliAccountBranchMappingId AND CAB7.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA7 on CA7.Id = CAB7.AccountId AND CA7.Deleted = 0 AND CA7.Active = 1
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB8 on CAB8.Id = [Z-PurchaseBillMaster-Z].CrossingDeliveryAccountBranchMappingId AND CAB8.Deleted = 0
	LEFT JOIN [CustomerAccount] AS CA8 on CA8.Id = CAB8.AccountId AND CA8.Deleted = 0 AND CA8.Active = 1
	WHERE [Z-PurchaseBillMaster-Z].YearId = @YearId
	AND [Z-PurchaseBillMaster-Z].[BranchId] = @BranchId
	AND [Z-PurchaseBillMaster-Z].Deleted = 0
	AND [Z-PurchaseBillMaster-Z].BillNumberBranch = @ChalanNumber

END
GO