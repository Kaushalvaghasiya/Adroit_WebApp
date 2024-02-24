CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanGetLRBookingTableListByPurchaseBillMasterId]
  @LoginId int,
  @BranchId int,
  @PurchaseBillMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
	    ROW_NUMBER() over (ORDER BY LRBooking.Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		LRBooking.Id,
		LRBooking.LRNumber,
		LRBooking.LRDate,
		LRBooking.PrivateMarka,
		LRBooking.ChargeWeight,
		LRBooking.InvoiceValue,
		LRBooking.Parcel,
		LRBooking.NetAmount,
		[TransportDesc].[Title] AS Description,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		(ISNULL([Freight],0)+ISNULL([Charges1],0)+ISNULL([Charges2],0)+ISNULL([Charges3],0)+ISNULL([Charges4],0)+ISNULL([Charges5],0)+ISNULL([Charges6],0)) AS ChargeAmount,
		dbo.fn_GetLRCrossingCharge(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCharge,
		dbo.fn_GetLRCrossingCommission(LRBooking.[BranchId], LRBooking.CityIdTo, LRBooking.LRRateOnId, LRBooking.Parcel, LRBooking.ChargeWeight, LRBooking.Freight) AS LRCrossingCommission
		FROM [Z-PurchaseBillDetail-Z]
		INNER JOIN [Z-LRBooking-Z] AS LRBooking ON LRBooking.[Id] = [Z-PurchaseBillDetail-Z].[LRBookingId] AND LRBooking.[BranchId] = @BranchId
		INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] AND [CustomerAccountBranchMapping].[BranchId] = @BranchId
		INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
		LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
		LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
		LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId 
		LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
		LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId 
		LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
		WHERE LRBooking.[BranchId] = @BranchId
		AND [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = @PurchaseBillMasterId
		AND LRBooking.Deleted = 0
		AND [Z-PurchaseBillDetail-Z].Deleted = 0
			  
END
GO