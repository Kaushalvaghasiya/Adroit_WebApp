CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceLRBookingGetGridDetailsByLRNumber]
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
		LRBooking.ChargeWeight,
		LRBooking.InvoiceValue,
		LRBooking.Parcel,
		LRBooking.NetAmount,
		[TransportPacking].[Title] AS Packing,
		[TransportDesc].[Title] AS Description,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		CA3.GSTInvoiceTypeId,
		LRBooking.EwayBillNo,
		[Vehilcle].VRN As VehilcleNo,
		LRBooking.BillAccountBranchMappingId,
		[CustomerAccount].CreditDays As CreditDays,
		[GSTRate].Rate As GSTRate,
		[Product].GstCentralCess AS GstCentralCessRate,
		[Product].GstStateCess AS GstStateCessRate
		FROM [Z-LRBooking-Z] AS LRBooking
			 INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id] 
			 INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id] AND [CustomerAccount].[CustomerId] = @CustomerId 
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId 
			 INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId 
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId 
			 INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
			 INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRBooking.BranchId 
			 INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			 INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
			 INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
			 LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
			 LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
			 LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id] 
			 LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
			 LEFT JOIN [TransportPacking] ON LRBooking.[PackingId] = [TransportPacking].[Id] 
			 LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId 
			 LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
			 LEFT JOIN [Vehilcle] on [Vehilcle].Id = LRBooking.VehicleId 
		WHERE LRBooking.[BranchId] = @BranchId
			AND LRBooking.YearId = @YearId
			AND LRBooking.Deleted = 0
			AND [CustomerAccountBranchMapping].Deleted = 0
			AND LRBooking.LRNumber = @LRNumberId
			AND LRBooking.Id NOT IN ( SELECT DISTINCT [Z-SalesBillDetail-Z].LRBookingId FROM [Z-SalesBillDetail-Z] WHERE [Z-SalesBillDetail-Z].Deleted = 0 )
END
GO