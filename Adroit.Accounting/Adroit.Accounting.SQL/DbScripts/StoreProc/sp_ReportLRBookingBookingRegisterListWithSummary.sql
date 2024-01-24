CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingBookingRegisterListWithSummary]
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

	WITH CTE AS (
        SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CASE WHEN @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ToCityWise THEN CT2.Title WHEN @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CASE WHEN @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ToCityWise THEN CT2.Title WHEN @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM([Z-LRBooking-Z].Parcel) END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM([Z-LRBooking-Z].Parcel) END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM([Z-LRBooking-Z].ChargeWeight) END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM([Z-LRBooking-Z].ChargeWeight) END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN (SUM(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0))) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN (SUM(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0))) END DESC,			
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN SUM([GSTRate].Rate) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM([GSTRate].Rate) END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN SUM([GSTRate].Rate) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SUM([GSTRate].Rate) END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN SUM([Z-LRBooking-Z].InvoiceValue) END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN SUM([Z-LRBooking-Z].InvoiceValue) END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN MAX([CustomerFirmBranch].Title) END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN MAX([CustomerFirmBranch].Title) END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,CASE WHEN @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ToCityWise THEN CT2.Title WHEN @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END As GroupingColumn
		,COUNT(*) As LRNumber
		,SUM(Parcel) As Parcel 
		,SUM(ChargeWeight) As ChargeWeight
		,SUM((ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0))) AS Amount
		,SUM([GSTRate].Rate) As Rate
		,SUM([GSTRate].Rate) As GSTAmount
		,SUM([Z-LRBooking-Z].InvoiceValue) As InvoiceValue
		,MAX([CustomerFirmBranch].Title) As BranchName
		,[Z-LRBooking-Z].Deleted
		FROM [Z-LRBooking-Z]
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId		
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId AND CA3.CustomerId = @CustomerId
		LEFT JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		LEFT JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
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
			GROUP BY [Z-LRBooking-Z].Deleted, CASE WHEN @SelectedView = @BillPartyWise THEN CONCAT(ISNULL(CA3.Name, ''),NULLIF(' | ' + ISNULL(CA3.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ToCityWise THEN CT2.Title WHEN @SelectedView = @ConsignorWise THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) WHEN @SelectedView = @ConsigneeWise THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END
	 ) SELECT * FROM CTE  
	 WHERE (Coalesce(@Search, '') = '' OR GroupingColumn LIKE '%' + @Search + '%'
                                   OR Parcel LIKE '%' + @Search + '%'
                                   OR ChargeWeight LIKE '%' + @Search + '%'
                                   OR Rate LIKE '%' + @Search + '%'
                                   OR InvoiceValue LIKE '%' + @Search + '%'
                                   OR BranchName LIKE '%' + @Search + '%')
	AND @PageSize = -1 OR (RowNum > @PageStart AND RowNum < (@PageStart + (@PageSize + 1)))
	ORDER BY RowNum;
End
Set Nocount off;
GO
