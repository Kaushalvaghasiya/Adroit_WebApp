CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetMasterDetailsByChalanNumber]
  @LoginId int,
  @BranchId int,
  @ChalanNumber int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT PBM.Id 
	,PBM.BillDate As ReceiveDate
	,PBM.EwayBillNumber 
	,PBM.TaxableAmount 
	,PBM.TDSAmount 
	,PBM.AdvanceCash 
	,PBM.AdvanceNeft 
	,PBM.ReceiveCash
	,PBM.OtherPlus 
	,PBM.OtherLess 
	,PBM.BrokerAmount 
	,PBM.Notes AS Remarks
	,PBM.ToPayAmount 
	,PBM.CrossingAmount 
	,PBM.CrossingCommission 
	,PBM.CrossingHamali 
	,PBM.CrossingDeliveryCharge 
	,(SELECT Title FROM City WHERE Id = PBM.CityIdFrom AND Active = 1) AS CityFrom
    ,(SELECT Title FROM City WHERE Id = PBM.CityIdTo AND Active = 1) AS CityTo
	,(SELECT VRN FROM Vehilcle WHERE Id = PBM.VehicleId AND CustomerId = @CustomerId AND Active = 1 AND Deleted = 0) AS VehicleNumber
	,(SELECT Name FROM Driver WHERE Id = PBM.DriverId AND CustomerId = @CustomerId AND Active = 1 AND Deleted = 0) AS DriverName
	,(SELECT CB.Name FROM [CustomerBrokerBranchMapping] AS CBBM LEFT JOIN [Broker] AS CB on CB.Id = CBBM.BrokerId AND CB.[CustomerId] = @CustomerId AND CB.Deleted = 0 AND CB.Active = 1 WHERE CBBM.Id = PBM.[BrokerBranchMappingId] AND CBBM.[BranchId] = @BranchId AND CBBM.Deleted = 0) AS BrokerName
	,(SELECT CA3.Name FROM [CustomerAccountBranchMapping] AS CAB3 INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.[CustomerId] = @CustomerId AND CA3.Deleted = 0 AND CA3.Active = 1  WHERE CAB3.Id = PBM.AccountBranchMappingId AND CAB3.[BranchId] = @BranchId AND CAB3.Deleted = 0) AS BillParty
	,(SELECT CA4.Name FROM [CustomerAccountBranchMapping] AS CAB4 LEFT JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId AND CA4.[CustomerId] = @CustomerId AND CA4.Deleted = 0 AND CA4.Active = 1  WHERE CAB4.Id = PBM.ToPayAccountBranchMappingId AND CAB4.[BranchId] = @BranchId AND CAB4.Deleted = 0) AS ToPayAccount
	,(SELECT CA5.Name FROM [CustomerAccountBranchMapping] AS CAB5 LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId AND CA5.[CustomerId] = @CustomerId AND CA5.Deleted = 0 AND CA5.Active = 1  WHERE CAB5.Id = PBM.CrossingAmountAccountBranchMappingId AND CAB5.[BranchId] = @BranchId AND CAB5.Deleted = 0) AS CrossingAmountAccount
	,(SELECT CA6.Name FROM [CustomerAccountBranchMapping] AS CAB6 LEFT JOIN [CustomerAccount] AS CA6 on CA6.Id = CAB6.AccountId AND CA6.[CustomerId] = @CustomerId AND CA6.Deleted = 0 AND CA6.Active = 1  WHERE CAB6.Id = PBM.CrossingCommissionAccountBranchMappingId AND CAB6.[BranchId] = @BranchId AND CAB6.Deleted = 0) AS CrossingCommissionAccount
	,(SELECT CA7.Name FROM [CustomerAccountBranchMapping] AS CAB7 LEFT JOIN [CustomerAccount] AS CA7 on CA7.Id = CAB7.AccountId AND CA7.[CustomerId] = @CustomerId AND CA7.Deleted = 0 AND CA7.Active = 1  WHERE CAB7.Id = PBM.CrossingHamaliAccountBranchMappingId AND CAB7.[BranchId] = @BranchId AND CAB7.Deleted = 0) AS CrossingHamaliAccount
	,(SELECT CA8.Name FROM [CustomerAccountBranchMapping] AS CAB8 LEFT JOIN [CustomerAccount] AS CA8 on CA8.Id = CAB8.AccountId AND CA8.[CustomerId] = @CustomerId AND CA8.Deleted = 0 AND CA8.Active = 1  WHERE CAB8.Id = PBM.CrossingDeliveryAccountBranchMappingId AND CAB8.[BranchId] = @BranchId AND CAB8.Deleted = 0) AS CrossingDeliveryChargeAccount
	,ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) AS NetAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	WHERE PBM.YearId = @YearId
	AND PBM.[BranchId] = @BranchId
	AND PBM.Deleted = 0
	AND PBM.BillNumberBranch = @ChalanNumber

END
GO