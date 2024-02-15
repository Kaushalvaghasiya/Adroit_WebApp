CREATE OR ALTER PROCEDURE [dbo].[sp_GetLRBookingListByCity]
  @LoginId int,
  @BranchId int,
  @FromCityIds VARCHAR(MAX),
  @ToCityIds VARCHAR(MAX)
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT  
	ROW_NUMBER() over (ORDER BY LRBooking.Id ASC) AS RowNum,
	Count(*) over () AS TotalCount, 
	LRBooking.Id,
	LRBooking.LRNumber,
	LRBooking.LRDate,
	LRBooking.PrivateMarka,
	LRBooking.ActualWeight,
	LRBooking.ChargeWeight,
	LRBooking.InvoiceValue,
	LRBooking.NetAmount,
	LRBooking.Parcel,
	[TransportPacking].[Title] AS Packing,
	[TransportDesc].[Title] AS Description,
	ToCity.[Title] AS CityTo,
	FromCity.[Title] AS CityFrom,
	[TransportLRPayType].[Title] AS LRPayType,
	(SELECT NAME FROM [CustomerAccount]
		INNER JOIN [CustomerAccountBranchMapping] ON CustomerAccount.Id = [CustomerAccountBranchMapping].AccountId
		WHERE [CustomerAccountBranchMapping].Id = LRBooking.AccountBranchMappingId) As Consignor,
	(SELECT NAME FROM [CustomerAccount]
		INNER JOIN [CustomerAccountBranchMapping] ON CustomerAccount.Id = [CustomerAccountBranchMapping].AccountId
		WHERE [CustomerAccountBranchMapping].Id = LRBooking.DeliveryAccountBranchMappingId) As Consignee,
	(SELECT NAME FROM [CustomerAccount]
		INNER JOIN [CustomerAccountBranchMapping] ON CustomerAccount.Id = [CustomerAccountBranchMapping].AccountId
		WHERE [CustomerAccountBranchMapping].Id = LRBooking.BillAccountBranchMappingId) As BillPartyName,
	(SELECT VRN FROM [Vehilcle] WHERE ID = VehicleId) As BookingVehilcleNo,
	(ISNULL([Freight],0) + ISNULL([Charges1],0) + ISNULL([Charges2],0) + ISNULL([Charges3],0) + ISNULL([Charges4],0) + ISNULL([Charges5],0) + ISNULL([Charges6],0)) AS ChargeAmount,
	dbo.fn_GetLRCrossingCharge(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCharge,
	dbo.fn_GetLRCrossingCommission(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCommission
	FROM [Z-LRBooking-Z] AS LRBooking
	LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
	LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
	LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id]
	LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id]
	LEFT JOIN [TransportPacking] ON LRBooking.[PackingId] = [TransportPacking].[Id]
	WHERE LRBooking.[BranchId] = @BranchId
	AND LRBooking.YearId = @YearId
	AND LRBooking.Deleted = 0
	AND (@FromCityIds = '0' OR LRBooking.CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@FromCityIds)))
	AND (@ToCityIds = '0' OR LRBooking.CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ToCityIds)))
	AND LRBooking.Id NOT IN (SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0)
END
GO