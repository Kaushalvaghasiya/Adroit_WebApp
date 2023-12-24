CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetGridDetailsByChalanNumber]
  @LoginId int,
  @FirmId int,
  @ChalanNumber int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT PBD.Id AS LRBookingId
	,PBD.LRBookingId AS LRNumber
	,PBD.Received AS Received
	,LBZ.LRDate AS LRDate 
	,LBZ.PrivateMarka AS PrivateMarka
	,LBZ.Parcel AS Packing
	,LBZ.ChargeWeight AS ChargeWeight
	,LBZ.CityIdTo AS CityIdTo
	,LBZ.CityIdFrom AS CityIdFrom
	,(SELECT Title FROM City WHERE Id = PBM.CityIdFrom) AS CityFrom
    ,(SELECT Title FROM City WHERE Id = PBM.CityIdTo) AS CityTo
	,(SELECT Title FROM TransportDesc WHERE Id = LBZ.DescriptionId AND CustomerId = @CustomerId) AS Description
	,(SELECT CA3.Name FROM [CustomerAccountBranchMapping] AS CAB3 INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.[CustomerId] = @CustomerId WHERE CAB3.Id = LBZ.AccountBranchMappingId) AS Consignor
	,(SELECT CA4.Name FROM [CustomerAccountBranchMapping] AS CAB4 INNER JOIN [CustomerAccount] AS CA4 on CA4.Id = CAB4.AccountId AND CA4.[CustomerId] = @CustomerId WHERE CAB4.Id = LBZ.DeliveryAccountBranchMappingId) AS Consignee
	,(SELECT CA5.Name FROM [CustomerAccountBranchMapping] AS CAB5 LEFT JOIN [CustomerAccount] AS CA5 on CA5.Id = CAB5.AccountId AND CA5.[CustomerId] = @CustomerId WHERE CAB5.Id = LBZ.BillAccountBranchMappingId) AS BillPartyName
	,(ISNULL(LBZ.[Freight],0)+ISNULL(LBZ.[Charges1],0)+ISNULL(LBZ.[Charges2],0)+ISNULL(LBZ.[Charges3],0)+ISNULL(LBZ.[Charges4],0)+ISNULL(LBZ.[Charges5],0)+ISNULL(LBZ.[Charges6],0)) AS ChargeAmount
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	LEFT JOIN [Z-PurchaseBillDetail-Z] AS PBD on PBD.PurchaseBillMasterId = PBM.Id AND PBM.Deleted = 0 
	LEFT JOIN [Z-LRBooking-Z] AS LBZ on LBZ.Id = PBD.LRBookingId AND LBZ.Deleted = 0 
	WHERE PBM.YearId = @YearId
	AND PBM.FirmId = @FirmId
	AND PBM.Deleted = 0
	AND PBM.BillNumberBranch = @ChalanNumber

END
GO