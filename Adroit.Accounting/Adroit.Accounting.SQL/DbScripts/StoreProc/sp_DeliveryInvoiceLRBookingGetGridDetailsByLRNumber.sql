CREATE OR ALTER PROCEDURE [dbo].[sp_DeliveryInvoiceLRBookingGetGridDetailsByLRNumber]
  @LoginId int,
  @BranchId int,
  @LRNumberId int,
  @IsAgency bit
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	IF (@IsAgency= 1) 
	BEGIN
		SELECT 
			LRBooking.Id,
			LRBooking.LRNumber,
			LRBooking.LRDate,
			LRBooking.PrivateMarka,
			LRBooking.ChargeWeight,
			0.00 AS InvoiceValue,
			LRBooking.Parcel,
			CASE LRPayTypeId WHEN 1 then LRBooking.NetAmount ELSE 0 END AS NetAmount,
			'' AS Packing,
			'' AS Description,
			ToCity.[Title] AS CityTo,
			FromCity.[Title] AS CityFrom,
			[TransportLRPayType].[Title] AS LRPayType,
			AccountParty.Name AS Consignor,
			AccountParty.CreditDays As CreditDays,
			dbo.fn_GetAccountName(LRBooking.DeliveryAccountBranchMappingId) AS Consignee,
			BillParty.Name As BillPartyName,
			BillParty.GSTInvoiceTypeId,
			LRBooking.EwayBillNo,
			'' As VehilcleNo,
			dbo.fn_GetAccountMappingIdForDifferentBranch(LRBooking.BillAccountBranchMappingId, @BranchId) AS BillAccountBranchMappingId,
			[GSTRate].Rate As GSTRate,
			[Product].GstCentralCess AS GstCentralCessRate,
			[Product].GstStateCess AS GstStateCessRate,
			@IsAgency AS IsAgency
			FROM [Z-ChalanReceiveAgencyMaster-Z] AS ChalanReceiveAgencyMaster
				INNER JOIN [Z-ChalanReceiveAgencyDetail-Z] AS LRBooking ON ChalanReceiveAgencyMaster.Id = LRBooking.ChalanReceiveAgencyMasterId
				 INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = ChalanReceiveAgencyMaster.BranchId 
				 INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
				 INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
				 INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
				 LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
				 LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
				 LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
				 LEFT JOIN [CustomerAccountBranchMapping] AS AccountMapping on AccountMapping.Id = LRBooking.AccountBranchMappingId
				 LEFT JOIN [CustomerAccount] AS AccountParty on AccountParty.Id = AccountMapping.AccountId 
				 LEFT JOIN [CustomerAccountBranchMapping] AS BillPartyMapping on BillPartyMapping.Id = LRBooking.BillAccountBranchMappingId 
				 LEFT JOIN [CustomerAccount] AS BillParty on BillParty.Id = BillPartyMapping.AccountId 
			WHERE LRBooking.Id = @LRNumberId
				AND LRBooking.Deleted = 0
				AND LRBooking.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].AgencyLRBookingId, 0) 
							FROM [Z-SalesBillMaster-Z] 
							INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
							WHERE [Z-SalesBillMaster-Z].[BranchId] = @BranchId 
							AND YearId = @YearId 
							AND [Z-SalesBillDetail-Z].Deleted = 0)
	END
	ELSE 
	BEGIN
		SELECT  
			LRBooking.Id,
			LRBooking.LRNumber,
			LRBooking.LRDate,
			LRBooking.PrivateMarka,
			LRBooking.ChargeWeight,
			LRBooking.InvoiceValue,
			LRBooking.Parcel,
			CASE LRPayTypeId WHEN 1 then LRBooking.NetAmount ELSE 0 END AS NetAmount,
			[TransportPacking].[Title] AS Packing,
			[TransportDesc].[Title] AS Description,
			ToCity.[Title] AS CityTo,
			FromCity.[Title] AS CityFrom,
			[TransportLRPayType].[Title] AS LRPayType,
			AccountParty.Name AS Consignor,
			AccountParty.CreditDays As CreditDays,
			dbo.fn_GetAccountName(LRBooking.DeliveryAccountBranchMappingId) AS Consignee,
			BillParty.Name As BillPartyName,
			BillParty.GSTInvoiceTypeId,
			LRBooking.EwayBillNo,
			[Vehilcle].VRN As VehilcleNo,
			dbo.fn_GetAccountMappingIdForDifferentBranch(LRBooking.BillAccountBranchMappingId, @BranchId) AS BillAccountBranchMappingId,
			[GSTRate].Rate As GSTRate,
			[Product].GstCentralCess AS GstCentralCessRate,
			[Product].GstStateCess AS GstStateCessRate,
			@IsAgency AS IsAgency
			FROM [Z-LRBooking-Z] AS LRBooking
				 INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRBooking.BranchId 
				 INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
				 INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
				 INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
				 LEFT JOIN [City] ToCity ON LRBooking.CityIdTo = ToCity.[Id] 
				 LEFT JOIN [City] FromCity ON LRBooking.CityIdFrom = FromCity.[Id] 
				 LEFT JOIN [TransportDesc] ON LRBooking.[DescriptionId] = [TransportDesc].[Id] 
				 LEFT JOIN [TransportLRPayType] ON LRBooking.[LRPayTypeId] = [TransportLRPayType].[Id] 
				 LEFT JOIN [TransportPacking] ON LRBooking.[PackingId] = [TransportPacking].[Id] 
				 LEFT JOIN [CustomerAccountBranchMapping] AS AccountMapping on AccountMapping.Id = LRBooking.AccountBranchMappingId
				 LEFT JOIN [CustomerAccount] AS AccountParty on AccountParty.Id = AccountMapping.AccountId 
				 LEFT JOIN [CustomerAccountBranchMapping] AS BillPartyMapping on BillPartyMapping.Id = LRBooking.BillAccountBranchMappingId 
				 LEFT JOIN [CustomerAccount] AS BillParty on BillParty.Id = BillPartyMapping.AccountId 
				 LEFT JOIN [Vehilcle] on [Vehilcle].Id = LRBooking.VehicleId 
			WHERE LRBooking.Id = @LRNumberId
				AND LRBooking.Id IN (SELECT PurchaseBillDetail.LRBookingId 
						FROM [Z-PurchaseBillMaster-Z] AS PurchaseBillMaster 
						INNER JOIN [Z-PurchaseBillDetail-Z] as PurchaseBillDetail ON PurchaseBillMaster.Id = PurchaseBillDetail.PurchaseBillMasterId
						INNER JOIN [Z-ChalanReceive-Z] AS ChalanReceive on PurchaseBillMaster.Id = ChalanReceive.PurchaseBillMasterId 
						WHERE PurchaseBillMaster.[BranchIdTo] = @BranchId
						AND PurchaseBillMaster.YearId = @YearId
						AND PurchaseBillMaster.Deleted = 0
						AND PurchaseBillDetail.Deleted = 0
						AND ChalanReceive.Deleted = 0) 
				AND LRBooking.Deleted = 0
				AND LRBooking.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) 
							FROM [Z-SalesBillMaster-Z] 
							INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
							WHERE [Z-SalesBillMaster-Z].[BranchId] = @BranchId 
							AND YearId = @YearId 
							AND [Z-SalesBillDetail-Z].Deleted = 0) 
	END
END
GO