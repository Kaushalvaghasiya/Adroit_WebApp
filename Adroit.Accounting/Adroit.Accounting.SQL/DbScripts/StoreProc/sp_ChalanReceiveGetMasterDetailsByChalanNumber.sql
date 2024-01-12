CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetMasterDetailsByChalanNumber]
  @LoginId int,
  @FirmId int,
  @ChalanNumber int,
  @SenderId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	
	DECLARE @BookBranchMappingId INT 

	SELECT @BookBranchMappingId = PurcahseBookBranchMappingId 
		FROM CustomerFirmBranchTransportSetting 
		WHERE CustomerFirmBranchTransportSetting.BranchId = @SenderId 

	SELECT PBM.Id,
	PBM.BillDate As ReceiveDate,
	PBM.EwayBillNumber,
	PBM.TaxableAmount,
	PBM.TDSPercent,
	PBM.TDSAmount,
	PBM.AdvanceCash, 
	PBM.AdvanceNeft,
	PBM.ReceiveCash,
	PBM.OtherPlus,
	PBM.OtherLess,
	PBM.BrokerAmount,
	PBM.Notes AS Remarks,
	PBM.ToPayAmount,
	PBM.CrossingAmount,
	PBM.CrossingCommission,
	PBM.CrossingHamali,
	PBM.CrossingDeliveryCharge,
	(SELECT Title FROM City WHERE Id = PBM.CityIdFrom) AS CityFrom,
    (SELECT Title FROM City WHERE Id = PBM.CityIdTo) AS CityTo,
	(SELECT VRN FROM Vehilcle WHERE Id = PBM.VehicleId AND CustomerId = @CustomerId) AS VehilcleNumber,
	(SELECT Name FROM Driver WHERE Id = PBM.DriverId AND CustomerId = @CustomerId) AS DriverName,
	(SELECT CB.Name FROM [CustomerBrokerBranchMapping] AS CBBM LEFT JOIN [Broker] AS CB on CB.Id = CBBM.BrokerId 
		AND CB.[CustomerId] = @CustomerId WHERE CBBM.Id = PBM.[BrokerBranchMappingId]) AS BrokerName,
	(SELECT CA3.Name FROM [CustomerAccountBranchMapping] AS CAB3 INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
		AND CA3.[CustomerId] = @CustomerId WHERE CAB3.Id = PBM.AccountBranchMappingId) AS BillParty,
	(SELECT CA4.Name FROM [CustomerAccountBranchMapping] AS CAB4 LEFT JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId 
		AND CA4.[CustomerId] = @CustomerId WHERE CAB4.Id = PBM.ToPayAccountBranchMappingId) AS ToPayAccountName,
	(SELECT CA5.Name FROM [CustomerAccountBranchMapping] AS CAB5 LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId 
		AND CA5.[CustomerId] = @CustomerId WHERE CAB5.Id = PBM.CrossingAmountAccountBranchMappingId) AS CrossingAmountAccountName,
	(SELECT CA6.Name FROM [CustomerAccountBranchMapping] AS CAB6 LEFT JOIN [CustomerAccount] AS CA6 on CA6.Id = CAB6.AccountId 
		AND CA6.[CustomerId] = @CustomerId WHERE CAB6.Id = PBM.CrossingCommissionAccountBranchMappingId) AS CrossingCommissionAccount,
	(SELECT CA7.Name FROM [CustomerAccountBranchMapping] AS CAB7 LEFT JOIN [CustomerAccount] AS CA7 on CA7.Id = CAB7.AccountId 
		AND CA7.[CustomerId] = @CustomerId WHERE CAB7.Id = PBM.CrossingHamaliAccountBranchMappingId) AS CrossingHamaliAccountName,
	(SELECT CA8.Name FROM [CustomerAccountBranchMapping] AS CAB8 LEFT JOIN [CustomerAccount] AS CA8 on CA8.Id = CAB8.AccountId 
		AND CA8.[CustomerId] = @CustomerId WHERE CAB8.Id = PBM.CrossingDeliveryAccountBranchMappingId) AS CrossingDeliveryChargeAccountName,
	ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) AS NetAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	WHERE PBM.FirmId = @FirmId
	AND PBM.BranchId = @SenderId
	AND PBM.YearId = @YearId
	AND PBM.BookBranchMappingId = @BookBranchMappingId
	AND PBM.BillNumberBranch = @ChalanNumber
	AND PBM.Deleted = 0
END
GO