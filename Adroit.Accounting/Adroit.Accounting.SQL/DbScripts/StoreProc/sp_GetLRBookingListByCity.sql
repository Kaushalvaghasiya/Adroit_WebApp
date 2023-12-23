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
	    ROW_NUMBER() over (ORDER BY [Z-LRBooking-Z].Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		[Z-LRBooking-Z].Id,
		[Z-LRBooking-Z].LRNumber,
		[Z-LRBooking-Z].LRDate,
		[Z-LRBooking-Z].PrivateMarka,
		[Z-LRBooking-Z].ActualWeight,
		[Z-LRBooking-Z].ChargeWeight,
		[Z-LRBooking-Z].InvoiceValue,
		[Z-LRBooking-Z].Parcel,
		[TransportPacking].[Title] AS Packing,
		[TransportDesc].[Title] AS Description,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		[GSTRate].Rate As Rate,
		[Vehilcle].VRN As VehilcleNo,
		(ISNULL([Freight],0)+ISNULL([Charges1],0)+ISNULL([Charges2],0)+ISNULL([Charges3],0)+ISNULL([Charges4],0)+ISNULL([Charges5],0)+ISNULL([Charges6],0)) AS ChargeAmount
		FROM [Z-LRBooking-Z]
			 INNER JOIN [CustomerAccountBranchMapping] ON [Z-LRBooking-Z].[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] AND [CustomerAccountBranchMapping].[BranchId] = @BranchId
			 INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId 
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId AND CAB1.Deleted = 0
			 INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId AND CAB2.Deleted = 0
			 INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.Deleted = 0 AND CA2.Active = 1
			 INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId AND [CustomerFirmBranch].Deleted = 0 AND [CustomerFirmBranch].Active = 1 
			 INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			 INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales AND [Product].Deleted = 0 AND [Product].Active = 1
			 INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId AND [GSTRate].Deleted = 0 AND [GSTRate].Active = 1
			 LEFT JOIN [City] ToCity ON [Z-LRBooking-Z].CityIdTo = ToCity.[Id] AND ToCity.Active = 1
			 LEFT JOIN [City] FromCity ON [Z-LRBooking-Z].CityIdFrom = FromCity.[Id] AND FromCity.Active = 1
			 LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
			 LEFT JOIN [TransportLRPayType] ON [Z-LRBooking-Z].[LRPayTypeId] = [TransportLRPayType].[Id] AND [TransportLRPayType].Deleted = 0 AND [TransportLRPayType].Active = 1
			 LEFT JOIN [TransportPacking] ON [Z-LRBooking-Z].[PackingId] = [TransportPacking].[Id] AND [TransportPacking].[CustomerId] = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
			 LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId AND CAB3.Deleted = 0
			 LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.Deleted = 0 AND CA3.Active = 1
			 LEFT JOIN [Vehilcle] on [Vehilcle].Id = [Z-LRBooking-Z].VehicleId AND [Vehilcle].CustomerId = @CustomerId AND [Vehilcle].Deleted = 0 AND [Vehilcle].Active = 1
		WHERE [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 )
			  AND [Z-LRBooking-Z].[BranchId] = @BranchId
			  AND [Z-LRBooking-Z].YearId = @YearId
			  AND ((@FromCityIds = '0' OR [Z-LRBooking-Z].CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@FromCityIds)))
				    AND 
				   (@ToCityIds = '0' OR [Z-LRBooking-Z].CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ToCityIds))))
			  AND [CustomerAccountBranchMapping].Deleted = 0
			  AND [CustomerAccount].Deleted = 0 AND [CustomerAccount].Active = 1
			  AND [Z-LRBooking-Z].Deleted = 0
END
GO