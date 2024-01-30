CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanGetLRBookingTableListByPurchaseBillMasterId]
  @LoginId int,
  @BranchId int,
  @PurchaseBillMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
	    ROW_NUMBER() over (ORDER BY [Z-LRBooking-Z].Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		[Z-LRBooking-Z].Id,
		[Z-LRBooking-Z].LRNumber,
		[Z-LRBooking-Z].LRDate,
		[Z-LRBooking-Z].PrivateMarka,
		[Z-LRBooking-Z].ChargeWeight,
		[Z-LRBooking-Z].InvoiceValue,
		[Z-LRBooking-Z].Parcel,
		[TransportDesc].[Title] AS Description,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		(ISNULL([Freight],0)+ISNULL([Charges1],0)+ISNULL([Charges2],0)+ISNULL([Charges3],0)+ISNULL([Charges4],0)+ISNULL([Charges5],0)+ISNULL([Charges6],0)) AS ChargeAmount
		FROM [Z-PurchaseBillDetail-Z]
			 INNER JOIN [Z-LRBooking-Z] ON [Z-LRBooking-Z].[Id] = [Z-PurchaseBillDetail-Z].[LRBookingId] AND [Z-LRBooking-Z].[BranchId] = @BranchId
			 INNER JOIN [CustomerAccountBranchMapping] ON [Z-LRBooking-Z].[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] AND [CustomerAccountBranchMapping].[BranchId] = @BranchId
			 INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId 
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId 
			 INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId 
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId 
			 INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
			 LEFT JOIN [City] ToCity ON [Z-LRBooking-Z].CityIdTo = ToCity.[Id] 
			 LEFT JOIN [City] FromCity ON [Z-LRBooking-Z].CityIdFrom = FromCity.[Id] 
			 LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId 
			 LEFT JOIN [TransportLRPayType] ON [Z-LRBooking-Z].[LRPayTypeId] = [TransportLRPayType].[Id] 
			 LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId 
			 LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
		WHERE [Z-LRBooking-Z].[BranchId] = @BranchId
			  AND [Z-LRBooking-Z].Deleted = 0
			  AND [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = @PurchaseBillMasterId
			  AND [Z-PurchaseBillDetail-Z].Deleted = 0
END
GO