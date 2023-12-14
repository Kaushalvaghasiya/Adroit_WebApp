CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanLRBookingGetGridDetailsByLRNumber]
  @LoginId int,
  @BranchId int,
  @LRNumberId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	   SELECT  
		[Z-LRBooking-Z].Id,
		[Z-LRBooking-Z].LRNumber,
		[Z-LRBooking-Z].LRDate,
		[Z-LRBooking-Z].PrivateMarka,
		[Z-LRBooking-Z].Parcel,
		[Z-LRBooking-Z].ChargeWeight,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[Z-LRBooking-Z].InvoiceValue,
		[TransportDesc].[Title] AS Description,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		[Z-LRBooking-Z].EwayBillNo,
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
			 LEFT JOIN [City] ToCity ON [Z-LRBooking-Z].CityIdTo = ToCity.[Id] AND ToCity.Active = 1
			 LEFT JOIN [City] FromCity ON [Z-LRBooking-Z].CityIdFrom = FromCity.[Id] AND FromCity.Active = 1
			 LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
			 LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId AND CAB3.Deleted = 0
			 LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.Deleted = 0 AND CA3.Active = 1
		WHERE [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 )
			  AND [Z-LRBooking-Z].YearId = @YearId
			  AND [Z-LRBooking-Z].[BranchId] = @BranchId
			  AND [Z-LRBooking-Z].Deleted = 0
			  AND [CustomerAccountBranchMapping].Deleted = 0
			  AND [CustomerAccount].Deleted = 0 AND [CustomerAccount].Active = 1
			  AND [Z-LRBooking-Z].LRNumber = @LRNumberId
END
GO