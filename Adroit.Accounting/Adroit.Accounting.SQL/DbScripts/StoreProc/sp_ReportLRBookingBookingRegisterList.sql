CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingBookingRegisterList]
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
  @PayTypeIds NVARCHAR(MAX),
  @ChalanId INT,
  @LRStatusId INT,
  @InvStatusId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC',
  @DateWise INT,
  @BillPartyWise INT,
  @ToCityWise INT,
  @ConsignorWise INT,
  @ConsigneeWise INT,
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @ToCityWise THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @ToCityWise THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' AND @SelectedView = @LRWise THEN [Z-LRBooking-Z].LRNumber END DESC,

			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' AND @SelectedView = @DateWise THEN [Z-LRBooking-Z].LRNumber END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRDate END DESC,
			
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise) THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise) THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRNumber END DESC,		

			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CT2.Title END DESC,	
			
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN [TransportDesc].[Title] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN [TransportDesc].[Title] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].Parcel END DESC,	
			
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' AND (@SelectedView = @DateWise OR @SelectedView = @LRWise OR @SelectedView = @ToCityWise) THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [TransportDesc].[Title] END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [TransportDesc].[Title] END DESC,	

			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' AND @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' AND @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END DESC,	

			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ChargeWeight END DESC,	

			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,	

			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,	

			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN [GSTRate].Rate END DESC,			
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].InvoiceValue END DESC,	
			
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' AND @SelectedView = @BillPartyWise THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' AND @SelectedView = @BillPartyWise THEN [Z-LRBooking-Z].InvoiceValue END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,

			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN 'Static' END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' THEN 'Static' END DESC,

			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-LRBooking-Z].LRNumber 
		,[Z-LRBooking-Z].LRDate 
		,CT2.Title As CityTo
		,[Z-LRBooking-Z].Parcel 
		,[TransportDesc].[Title] AS Description
		,CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) AS Consignor
		,CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) AS Consignee
		,CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) AS BillPartyName
		,[Z-LRBooking-Z].ChargeWeight 
		,(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) AS Amount
		,[GSTRate].Rate As Rate
		,[GSTRate].Rate As GSTAmount
		,[Z-LRBooking-Z].InvoiceValue
		,[TransportLRPayType].Title As LRPayType
		,'STATIC' As LoadingChalanNo
		,[CustomerFirmBranch].Title As BranchName
		,[Z-LRBooking-Z].Deleted
		FROM [Z-LRBooking-Z]
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.CustomerId = @CustomerId
		LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId
		LEFT JOIN [TransportLRPayType] ON [Z-LRBooking-Z].[LRPayTypeId] = [TransportLRPayType].[Id]
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
		AND (
				@LRStatusId = '0'
				OR (@LRStatusId = '1' AND [Z-LRBooking-Z].Deleted = 0)
				OR (@LRStatusId = '2' AND [Z-LRBooking-Z].Deleted = 1)
			)
		AND (Coalesce(@Search,'') = '' 
									   --OR [Z-LRBooking-Z].LRNumber like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].LRDate like '%'+ @Search + '%'
									   OR CT2.Title like '%'+ @Search + '%'
									   --OR [Z-LRBooking-Z].Parcel like '%'+ @Search + '%'
									   OR [TransportDesc].Title like '%'+ @Search + '%'
									   OR CA1.Name like '%'+ @Search + '%'
									   OR CA2.Name like '%'+ @Search + '%'
									   --OR [Z-LRBooking-Z].ChargeWeight like '%'+ @Search + '%'
									   --OR [GSTRate].Rate like '%'+ @Search + '%'
									   --OR [Z-LRBooking-Z].InvoiceValue like '%'+ @Search + '%'
									   OR [TransportLRPayType].Title like '%'+ @Search + '%'
									   OR [CustomerFirmBranch].Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE @PageSize = -1 OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1)))
End
Set Nocount off;
GO
