CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingLRRegisterList]
  @LoginId INT,
  @FirmId INT,
  @SelectedView int,
  @BranchIds NVARCHAR(MAX),
  @DateFrom DATETIME,
  @DateTo DATETIME,
  @CityFromIds NVARCHAR(MAX),
  @CityToIds NVARCHAR(MAX),
  @LRFrom INT,
  @LRTo INT,
  @ConsignorIds NVARCHAR(MAX),
  @ConsigneeIds NVARCHAR(MAX),
  @BillPartyIds NVARCHAR(MAX),
  @PvtMarkIds NVARCHAR(MAX),
  @PayTypeIds NVARCHAR(MAX),
  @ChalanId INT,
  @InvStatusId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = -1,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC',
  @DateWise INT,
  @PartyWise INT,
  @LRWise INT
As
Set Nocount on;
Begin
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRDate END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRDate END DESC, 
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN CA3.Name END ASC, 
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN CA3.Name END DESC, 
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRNumber END ASC, 
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRNumber END DESC, 

			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRNumber END DESC, 
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN CA1.Name END ASC, 
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN CA1.Name END DESC, 
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRDate END ASC, 
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRDate END DESC, 

			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN CA2.Name END ASC, 
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN CA2.Name END DESC, 
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].LRNumber END ASC, 
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].LRNumber END DESC, 
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].LRDate END ASC, 
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].LRDate END DESC, 
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [TransportDesc].Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [TransportDesc].Title END DESC,			
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [TransportDesc].Title END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [TransportDesc].Title END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN [TransportPacking].Title END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN [TransportPacking].Title END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].PrivateMarka END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].PrivateMarka END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [TransportPacking].Title END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [TransportPacking].Title END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].PrivateMarka END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [Z-LRBooking-Z].PrivateMarka END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].InvoiceValue END DESC,	
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' AND @SelectedView = @PartyWise THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' AND @SelectedView = @PartyWise THEN [GSTRate].Rate END DESC,					
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC,
			CASE WHEN @SortColumn = 14 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 14 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,
			CASE WHEN @SortColumn = 15 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 15 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].InvoiceValue END DESC,
			CASE WHEN @SortColumn = 16 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 16 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,CA1.Name As Consignor
		,CA2.Name As Consignee
		,CA3.Name As BillPartyName
		,[Z-LRBooking-Z].LRDate 
		,[Z-LRBooking-Z].LRNumber 
		,CT1.Title As CityFrom
		,CT2.Title As CityTo
		,[TransportDesc].Title As Description
		,[Z-LRBooking-Z].Parcel 
		,[Z-LRBooking-Z].ChargeWeight 
		,[TransportPacking].Title As Packing 
		,[Z-LRBooking-Z].PrivateMarka
		,(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) AS Amount
		,[GSTRate].Rate As Rate
		,[GSTRate].Rate As GSTAmount
		,[TransportLRPayType].Title As LRPayType
		,[Z-LRBooking-Z].InvoiceValue
		,[CustomerFirmBranch].Title As BranchName
		FROM [Z-LRBooking-Z]
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId  
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.CustomerId = @CustomerId 
		INNER JOIN [City] AS CT1 on CT1.Id = [Z-LRBooking-Z].CityIdFrom
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [TransportLRPayType] on TransportLRPayType.Id = [Z-LRBooking-Z].LRPayTypeId
		LEFT JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		LEFT JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
		LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId
		LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId
		WHERE [CustomerFirmBranch].Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
		AND [Z-LRBooking-Z].YearId = @YearId 
		AND (@DateFrom IS NULL OR CAST([Z-LRBooking-Z].LRDate AS DATE) >= @DateFrom)
		AND (@DateTo IS NULL OR CAST([Z-LRBooking-Z].LRDate AS DATE) <= @DateTo)
		AND (@CityFromIds = '0' OR [Z-LRBooking-Z].CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityFromIds)))
		AND (@CityToIds = '0' OR [Z-LRBooking-Z].CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityToIds)))
		AND (@LRFrom = '0' OR [Z-LRBooking-Z].LRNumber >= @LRFrom)
		AND (@LRTo = '0' OR [Z-LRBooking-Z].LRNumber <= @LRTo)
		AND (@ConsignorIds = '0' OR [Z-LRBooking-Z].AccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsignorIds)))
		AND (@ConsigneeIds = '0' OR [Z-LRBooking-Z].DeliveryAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsigneeIds)))
		AND (@BillPartyIds = '0' OR [Z-LRBooking-Z].BillAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BillPartyIds)))
		AND (@PvtMarkIds = '0' OR [Z-LRBooking-Z].PrivateMarka IN (SELECT value FROM STRING_SPLIT(@PvtMarkIds, ',')))
		AND (@PayTypeIds = '0' OR [Z-LRBooking-Z].LRPayTypeId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@PayTypeIds)))
		AND (
				@ChalanId = '0' 
				OR (@ChalanId = '1' AND [Z-LRBooking-Z].Id IN ( SELECT LRBookingId FROM [Z-PurchaseBillMaster-Z] INNER JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillMaster-Z].ID = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-PurchaseBillDetail-Z].Deleted = 0))
				OR (@ChalanId = '2' AND [Z-LRBooking-Z].Id NOT IN ( SELECT LRBookingId FROM [Z-PurchaseBillMaster-Z] INNER JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillMaster-Z].ID = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-PurchaseBillDetail-Z].Deleted = 0))
			)
		AND (
				@InvStatusId = '0'
				OR (@InvStatusId = '1' AND [Z-LRBooking-Z].Id IN ( SELECT LRBookingId FROM [Z-SalesBillMaster-Z] INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].ID = [Z-SalesBillDetail-Z].SalesBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-SalesBillDetail-Z].Deleted = 0))
				OR (@InvStatusId = '2' AND [Z-LRBooking-Z].Id NOT IN ( SELECT LRBookingId FROM [Z-SalesBillMaster-Z] INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].ID = [Z-SalesBillDetail-Z].SalesBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-SalesBillDetail-Z].Deleted = 0))
			)
		AND (Coalesce(@Search,'') = '' OR [Z-LRBooking-Z].LRDate like '%'+ @Search + '%'
									   OR CA1.Name like '%'+ @Search + '%'
									   OR CA2.Name like '%'+ @Search + '%'
									   OR CA3.Name like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].LRNumber like '%'+ @Search + '%'
									   OR CT1.Title like '%'+ @Search + '%'
									   OR CT2.Title like '%'+ @Search + '%'
									   OR [TransportDesc].Title like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].Parcel like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].ChargeWeight like '%'+ @Search + '%'
									   OR [TransportPacking].Title like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].PrivateMarka like '%'+ @Search + '%'
									   OR [GSTRate].Rate like '%'+ @Search + '%'
									   OR [TransportLRPayType].Title like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].InvoiceValue like '%'+ @Search + '%'
									   OR [CustomerFirmBranch].Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE @PageSize = -1 OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1)))
End
Set Nocount off;
GO
