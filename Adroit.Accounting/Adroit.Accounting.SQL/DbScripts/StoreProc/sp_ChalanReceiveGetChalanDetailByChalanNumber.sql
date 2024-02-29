CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGetChalanDetailByChalanNumber]
  @LoginId int,
  @FirmId int,
  @ChalanNumber int,
  @SenderId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	DECLARE @BranchId INT = DBO.fn_GetLoggedInBranchId(@LoginId);

	SELECT PBD.LRBookingId AS LRBookingId,
	LRBooking.LRNumber AS LRNumber,
	PBD.Received AS Received,
	LRBooking.LRDate AS LRDate,
	LRBooking.PrivateMarka AS PrivateMarka,
	LRBooking.Parcel AS Packing,
	LRBooking.ChargeWeight AS ChargeWeight,
	LRBooking.CityIdTo AS CityIdTo,
	LRBooking.CityIdFrom AS CityIdFrom,
	(SELECT Title FROM City WHERE Id = LRBooking.CityIdFrom) AS CityFrom,
    (SELECT Title FROM City WHERE Id = LRBooking.CityIdTo) AS CityTo,
	(SELECT Title FROM TransportDesc WHERE Id = LRBooking.DescriptionId AND CustomerId = @CustomerId) AS Description,
	dbo.fn_GetAccountName(LRBooking.AccountBranchMappingId) AS Consignor,
	dbo.fn_GetAccountName(LRBooking.DeliveryAccountBranchMappingId) AS Consignee,
	dbo.fn_GetAccountName(LRBooking.BillAccountBranchMappingId) AS BillPartyName,
	NetAmount AS ChargeAmount	
	FROM [Z-PurchaseBillMaster-Z] AS PBM
	LEFT JOIN [Z-PurchaseBillDetail-Z] AS PBD on PBD.PurchaseBillMasterId = PBM.Id AND PBD.Deleted = 0 
	LEFT JOIN [Z-LRBooking-Z] AS LRBooking on LRBooking.Id = PBD.LRBookingId AND LRBooking.Deleted = 0 
	WHERE PBM.Id = @ChalanNumber
	AND PBM.BranchId = @SenderId
	AND PBM.BranchIdTo = @BranchId
	AND PBM.Deleted = 0
END
GO