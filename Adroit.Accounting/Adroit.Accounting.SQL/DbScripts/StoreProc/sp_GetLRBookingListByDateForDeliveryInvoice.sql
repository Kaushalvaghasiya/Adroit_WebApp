CREATE OR ALTER PROCEDURE [dbo].[sp_GetLRBookingListByDateForDeliveryInvoice]
  @LoginId INT,
  @FirmId INT,
  @BranchId INT,
  @FromDate NVARCHAR(20),
  @ToDate NVARCHAR(20),
  @PayTypeId NVARCHAR(20),
  @AccountBranchMappingId NVARCHAR(20)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT  
		ROW_NUMBER() over (ORDER BY LRBooking.Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		LRBooking.Id,
		CAST (LRBooking.LRNumber AS VARCHAR) LRNumberString,
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
		[Product].GstStateCess AS GstStateCessRate,
		0 AS IsAgency
	FROM [Z-LRBooking-Z] AS LRBooking
	INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id]
	INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id]
	INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId
	INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId
	INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId 
	INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
	INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = @BranchId 
	INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
	INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
	INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
	LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id]
	LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
	LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId
	LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
	LEFT JOIN [TransportPacking] ON LRBooking.[PackingId] = [TransportPacking].[Id] 
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId 
	LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
	LEFT JOIN [Vehilcle] on [Vehilcle].Id = LRBooking.VehicleId 
	WHERE LRBooking.Id IN (SELECT ISNULL(PurchaseBillDetail.LRBookingId, 0)
					FROM [Z-PurchaseBillMaster-Z] AS PurchaseBillMaster 
					INNER JOIN [Z-PurchaseBillDetail-Z] as PurchaseBillDetail ON PurchaseBillMaster.Id = PurchaseBillDetail.PurchaseBillMasterId
					INNER JOIN [Z-ChalanReceive-Z] AS ChalanReceive on PurchaseBillMaster.Id = ChalanReceive.PurchaseBillMasterId 
					WHERE PurchaseBillMaster.[BranchIdTo] = @BranchId
					AND PurchaseBillMaster.YearId = @YearId
					AND PurchaseBillMaster.Deleted = 0
					AND PurchaseBillDetail.Deleted = 0
					AND ChalanReceive.Deleted = 0)
		AND LRBooking.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) 
						FROM [Z-SalesBillMaster-Z] 
						INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
						WHERE [Z-SalesBillMaster-Z].[BranchId] = @BranchId 
						AND YearId = @YearId 
						AND [Z-SalesBillDetail-Z].Deleted = 0) 
		AND LRBooking.Deleted = 0 
		AND LRBooking.BillAccountBranchMappingId = dbo.fn_GetAccountMappingIdForDifferentBranch(@AccountBranchMappingId, LRBooking.BranchId)

	UNION ALL

	SELECT  
		ROW_NUMBER() over (ORDER BY LRBooking.Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		LRBooking.Id,
		(LRNumber + ' | ' + ISNULL(FromCity.Title, '') + ' | ' + dbo.fn_GetAccountName(AgencyMaster.SenderBranchAccountMappingid)) AS LRNumberString,
		LRBooking.LRDate,
		LRBooking.PrivateMarka,
		LRBooking.ChargeWeight,
		0 AS InvoiceValue,
		LRBooking.Parcel,
		LRBooking.NetAmount,
		'' AS Packing,
		'' AS Description,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee,
		CA3.Name As BillPartyName,
		CA3.GSTInvoiceTypeId,
		LRBooking.EwayBillNo,
		'' As VehilcleNo,
		LRBooking.BillAccountBranchMappingId,
		[CustomerAccount].CreditDays As CreditDays,
		[GSTRate].Rate As GSTRate,
		[Product].GstCentralCess AS GstCentralCessRate,
		[Product].GstStateCess AS GstStateCessRate,
		1 AS IsAgency
	FROM [Z-ChalanReceiveAgencyMaster-Z] AS AgencyMaster 
	INNER JOIN [Z-ChalanReceiveAgencyDetail-Z] AS LRBooking ON AgencyMaster.Id = LRBooking.ChalanReceiveAgencyMasterId
	INNER JOIN [CustomerAccountBranchMapping] ON LRBooking.[AccountBranchMappingId] = [CustomerAccountBranchMapping].[Id]
	INNER JOIN [CustomerAccount] ON [CustomerAccountBranchMapping].[AccountId] = [CustomerAccount].[Id]
	INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRBooking.AccountBranchMappingId
	INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId
	INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = LRBooking.DeliveryAccountBranchMappingId 
	INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
	INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = @BranchId 
	INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
	INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
	INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
	LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id]
	LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
	LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
	LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId 
	LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
	WHERE AgencyMaster.[BranchId] = @BranchId
	AND LRBooking.BillAccountBranchMappingId = dbo.fn_GetAccountMappingIdForDifferentBranch(@AccountBranchMappingId, AgencyMaster.BranchId)
	AND LRBooking.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].AgencyLRBookingId, 0) FROM [Z-SalesBillDetail-Z] WHERE [Z-SalesBillDetail-Z].Deleted = 0) 
	AND AgencyMaster.Deleted = 0 
	AND LRBooking.Deleted = 0 
END
GO