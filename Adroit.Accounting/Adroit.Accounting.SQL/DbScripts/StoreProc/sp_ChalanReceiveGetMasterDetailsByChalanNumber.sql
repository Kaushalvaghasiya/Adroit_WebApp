CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetMasterDetailsByChalanNumber]
  @LoginId int,
  @FirmId int,
  @ChalanNumber int,
  @SenderId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	DECLARE @BranchId INT = DBO.fn_GetLoggedInBranchId(@LoginId);

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
	(SELECT CB.Name FROM [CustomerBrokerBranchMapping] AS CBBM LEFT JOIN [Broker] AS CB on CB.Id = CBBM.BrokerId WHERE CBBM.Id = PBM.[BrokerBranchMappingId]) AS BrokerName,
	dbo.fn_GetAccountName(PBM.AccountBranchMappingId) AS BillParty,
	dbo.fn_GetAccountName(PBM.SalesAccountBranchMappingId) AS ToPayAccountName,
	dbo.fn_GetAccountName(PBM.CrossingAmountAccountBranchMappingId) AS CrossingAmountAccountName,
	dbo.fn_GetAccountName(PBM.CrossingCommissionAccountBranchMappingId) AS CrossingCommissionAccountName,
	dbo.fn_GetAccountName(PBM.CrossingHamaliAccountBranchMappingId) AS CrossingHamaliAccountName,
	dbo.fn_GetAccountName(PBM.CrossingDeliveryAccountBranchMappingId) AS CrossingDeliveryChargeAccountName,
	ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) AS NetAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	WHERE PBM.Id = @ChalanNumber
	AND PBM.BranchId = @SenderId
	AND PBM.BranchIdTo = @BranchId
	AND PBM.Deleted = 0
END
GO