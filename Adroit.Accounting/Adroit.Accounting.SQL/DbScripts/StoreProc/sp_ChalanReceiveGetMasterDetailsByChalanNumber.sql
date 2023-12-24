CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetMasterDetailsByChalanNumber]
  @LoginId int,
  @FirmId int,
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

	,(
		SELECT CCA1.Name FROM CustomerFirmBranchTransportSetting CFT1
		INNER JOIN CustomerAccountBranchMapping As CAMP1 on CAMP1.Id = CFT1.ToPayAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CCA1 on CCA1.Id = CAMP1.AccountId AND CCA1.[CustomerId] = @CustomerId 
		WHERE CFT1.BranchId = PBM.BranchIdTo
	) AS ToPayAccountLabel
	,(	
		SELECT CCA2.Name FROM CustomerFirmBranchTransportSetting CFT2
		LEFT JOIN CustomerAccountBranchMapping As CAMP2 on CAMP2.Id = CFT2.CrossingAmountAccountBranchMappingId
		LEFT JOIN [CustomerAccount] AS CCA2 on CCA2.Id = CAMP2.AccountId AND CCA2.[CustomerId] = @CustomerId 
		WHERE CFT2.BranchId = PBM.BranchIdTo
	) AS CrossingAmountAccountLabel
	,(	
		SELECT CCA3.Name FROM CustomerFirmBranchTransportSetting CFT3
		LEFT JOIN CustomerAccountBranchMapping As CAMP3 on CAMP3.Id = CFT3.CrossingCommissionAccountBranchMappingId
		LEFT JOIN [CustomerAccount] AS CCA3 on CCA3.Id = CAMP3.AccountId AND CCA3.[CustomerId] = @CustomerId 
		WHERE CFT3.BranchId = PBM.BranchIdTo
	) AS CrossingCommissionAccountLabel
	,(	
		SELECT CCA4.Name FROM CustomerFirmBranchTransportSetting CFT4
		LEFT JOIN CustomerAccountBranchMapping As CAMP4 on CAMP4.Id = CFT4.CrossingHamaliAccountBranchMappingId
		LEFT JOIN [CustomerAccount] AS CCA4 on CCA4.Id = CAMP4.AccountId AND CCA4.[CustomerId] = @CustomerId 
		WHERE CFT4.BranchId = PBM.BranchIdTo
	) AS CrossingHamaliAccountLabel
	,(	
		SELECT CCA5.Name FROM CustomerFirmBranchTransportSetting CFT5
		LEFT JOIN CustomerAccountBranchMapping As CAMP5 on CAMP5.Id = CFT5.CrossingDeliveryChargeAccountBranchMappingId
		LEFT JOIN [CustomerAccount] AS CCA5 on CCA5.Id = CAMP5.AccountId AND CCA5.[CustomerId] = @CustomerId 
		WHERE CFT5.BranchId = PBM.BranchIdTo
	) AS CrossingDeliveryChargeAccountLabel

	,(SELECT Title FROM City WHERE Id = PBM.CityIdFrom) AS CityFrom
    ,(SELECT Title FROM City WHERE Id = PBM.CityIdTo) AS CityTo
	,(SELECT VRN FROM Vehilcle WHERE Id = PBM.VehicleId AND CustomerId = @CustomerId) AS VehilcleNumber
	,(SELECT Name FROM Driver WHERE Id = PBM.DriverId AND CustomerId = @CustomerId) AS DriverName
	,(SELECT CB.Name FROM [CustomerBrokerBranchMapping] AS CBBM LEFT JOIN [Broker] AS CB on CB.Id = CBBM.BrokerId AND CB.[CustomerId] = @CustomerId WHERE CBBM.Id = PBM.[BrokerBranchMappingId]) AS BrokerName
	,(SELECT CA3.Name FROM [CustomerAccountBranchMapping] AS CAB3 INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.[CustomerId] = @CustomerId WHERE CAB3.Id = PBM.AccountBranchMappingId) AS BillParty
	,(SELECT CA4.Name FROM [CustomerAccountBranchMapping] AS CAB4 LEFT JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId AND CA4.[CustomerId] = @CustomerId WHERE CAB4.Id = PBM.ToPayAccountBranchMappingId) AS ToPayAccount
	,(SELECT CA5.Name FROM [CustomerAccountBranchMapping] AS CAB5 LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId AND CA5.[CustomerId] = @CustomerId WHERE CAB5.Id = PBM.CrossingAmountAccountBranchMappingId) AS CrossingAmountAccount
	,(SELECT CA6.Name FROM [CustomerAccountBranchMapping] AS CAB6 LEFT JOIN [CustomerAccount] AS CA6 on CA6.Id = CAB6.AccountId AND CA6.[CustomerId] = @CustomerId WHERE CAB6.Id = PBM.CrossingCommissionAccountBranchMappingId) AS CrossingCommissionAccount
	,(SELECT CA7.Name FROM [CustomerAccountBranchMapping] AS CAB7 LEFT JOIN [CustomerAccount] AS CA7 on CA7.Id = CAB7.AccountId AND CA7.[CustomerId] = @CustomerId WHERE CAB7.Id = PBM.CrossingHamaliAccountBranchMappingId) AS CrossingHamaliAccount
	,(SELECT CA8.Name FROM [CustomerAccountBranchMapping] AS CAB8 LEFT JOIN [CustomerAccount] AS CA8 on CA8.Id = CAB8.AccountId AND CA8.[CustomerId] = @CustomerId WHERE CAB8.Id = PBM.CrossingDeliveryAccountBranchMappingId) AS CrossingDeliveryChargeAccount
	,ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) AS NetAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	WHERE PBM.YearId = @YearId
	AND PBM.FirmId = @FirmId
	AND PBM.Deleted = 0
	AND PBM.BillNumberBranch = @ChalanNumber

END
GO