CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetGridDetailsByChalanNumber]
  @LoginId int,
  @BranchId int,
  @ChalanNumber int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT PBD.Id AS LRBookingId
	,PBD.LRBookingId AS LRNumber
	,LBZ.LRDate AS LRDate 
	,LBZ.PrivateMarka AS PrivateMarka
	,LBZ.Parcel AS Packing
	,LBZ.ChargeWeight AS ChargeWeight
	,LBZ.CityIdTo AS CityIdTo
	,LBZ.CityIdFrom AS CityIdFrom
	,(SELECT Title FROM City WHERE Id = PBM.CityIdFrom AND Active = 1) AS CityFrom
    ,(SELECT Title FROM City WHERE Id = PBM.CityIdTo AND Active = 1) AS CityTo
	,(SELECT Title FROM TransportDesc WHERE Id = LBZ.DescriptionId AND CustomerId = @CustomerId AND Deleted = 0 AND Active = 1) AS Description
	,(SELECT CA3.Name FROM [CustomerAccountBranchMapping] AS CAB3 INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.[CustomerId] = @CustomerId AND CA3.Deleted = 0 AND CA3.Active = 1  WHERE CAB3.Id = LBZ.AccountBranchMappingId AND CAB3.[BranchId] = @BranchId AND CAB3.Deleted = 0) AS Consignor
	,(SELECT CA4.Name FROM [CustomerAccountBranchMapping] AS CAB4 INNER JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId AND CA4.[CustomerId] = @CustomerId AND CA4.Deleted = 0 AND CA4.Active = 1  WHERE CAB4.Id = LBZ.DeliveryAccountBranchMappingId AND CAB4.[BranchId] = @BranchId AND CAB4.Deleted = 0) AS Consignee
	,(SELECT CA5.Name FROM [CustomerAccountBranchMapping] AS CAB5 LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId AND CA5.[CustomerId] = @CustomerId AND CA5.Deleted = 0 AND CA5.Active = 1  WHERE CAB5.Id = LBZ.BillAccountBranchMappingId AND CAB5.[BranchId] = @BranchId AND CAB5.Deleted = 0) AS BillPartyName
	,(ISNULL(LBZ.[Freight],0)+ISNULL(LBZ.[Charges1],0)+ISNULL(LBZ.[Charges2],0)+ISNULL(LBZ.[Charges3],0)+ISNULL(LBZ.[Charges4],0)+ISNULL(LBZ.[Charges5],0)+ISNULL(LBZ.[Charges6],0)) AS ChargeAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	LEFT JOIN [Z-PurchaseBillDetail-Z] AS PBD on PBD.PurchaseBillMasterId = PBM.Id AND PBM.Deleted = 0 
	LEFT JOIN [Z-LRBooking-Z] AS LBZ on LBZ.Id = PBD.LRBookingId AND LBZ.Deleted = 0 AND LBZ.BranchId = @BranchId
	WHERE PBM.YearId = @YearId
	AND PBM.[BranchId] = @BranchId
	AND PBM.Deleted = 0
	AND PBM.BillNumberBranch = @ChalanNumber

END
GO