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
		(ISNULL([Freight],0)+ISNULL([Charges1],0)+ISNULL([Charges2],0)+ISNULL([Charges3],0)+ISNULL([Charges4],0)+ISNULL([Charges5],0)+ISNULL([Charges6],0)) AS ChargeAmount,
		dbo.fn_GetLRCrossingCharge(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCharge,
		dbo.fn_GetLRCrossingCommission(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCommission
		FROM [Z-LRBooking-Z] AS LRBooking
		INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] AND [CustomerAccountBranchMapping].[BranchId] = @BranchId
		INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId AND CAB1.Deleted = 0
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId AND CAB2.Deleted = 0
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.Deleted = 0 AND CA2.Active = 1
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRBooking.BranchId AND [CustomerFirmBranch].Deleted = 0 AND [CustomerFirmBranch].Active = 1 
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales AND [Product].Deleted = 0 AND [Product].Active = 1
		LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] AND ToCity.Active = 1
		LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] AND FromCity.Active = 1
		LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
		LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId AND CAB3.Deleted = 0
		LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.Deleted = 0 AND CA3.Active = 1
		WHERE LRBooking.Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 )
			  AND LRBooking.YearId = @YearId
			  AND LRBooking.[BranchId] = @BranchId
			  AND LRBooking.Deleted = 0
			  AND [CustomerAccountBranchMapping].Deleted = 0
			  AND [CustomerAccount].Deleted = 0 AND [CustomerAccount].Active = 1
			  AND LRBooking.LRNumber = @LRNumberId
END
GO