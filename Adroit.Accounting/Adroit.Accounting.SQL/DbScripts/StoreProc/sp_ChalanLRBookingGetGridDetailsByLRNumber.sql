CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanLRBookingGetGridDetailsByLRNumber]
  @LoginId int,
  @BranchId int,
  @LRNumberId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT  
		LRBooking.Id,
		LRBooking.LRNumber,
		LRBooking.LRDate,
		LRBooking.PrivateMarka,
		LRBooking.Parcel,
		LRBooking.ChargeWeight,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		LRBooking.InvoiceValue,
		[TransportDesc].[Title] AS Description,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		LRBooking.EwayBillNo,
		LRBooking.NetAmount,
		dbo.fn_GetLRCrossingCharge(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCharge,
		dbo.fn_GetLRCrossingCommission(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCommission
	FROM [Z-LRBooking-Z] AS LRBooking
	INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] 
	INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id]
	INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId
	INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId
	INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId
	INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId
	INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRBooking.BranchId
	INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
	INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales
	INNER JOIN GSTRate ON Product.GSTRateId = GSTRate.Id
	LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
	LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
	LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id]
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId
	LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId
	WHERE LRBooking.Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 )
		AND LRBooking.YearId = @YearId
		AND LRBooking.[BranchId] = @BranchId
		AND LRBooking.Deleted = 0
		AND LRBooking.LRNumber = @LRNumberId
END
GO