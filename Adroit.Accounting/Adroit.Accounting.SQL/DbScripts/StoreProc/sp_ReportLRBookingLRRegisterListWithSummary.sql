CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingLRRegisterListWithSummary]
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
  @LRStatusId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
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

	WITH CTE AS (
        SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CASE WHEN @SelectedView = @DateWise THEN CAST(LRB.LRDate AS VARCHAR(100)) WHEN @SelectedView = @PartyWise THEN CA1.Name END END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CASE WHEN @SelectedView = @DateWise THEN CAST(LRB.LRDate AS VARCHAR(100)) WHEN @SelectedView = @PartyWise THEN CA1.Name END END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM(LRB.Parcel) END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM(LRB.Parcel) END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM(LRB.ChargeWeight) END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM(LRB.ChargeWeight) END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN (SUM(ISNULL(LRB.Freight,0)+ISNULL(LRB.Charges1,0)+ISNULL(LRB.Charges2,0)+ISNULL(LRB.Charges3,0)+ISNULL(LRB.Charges4,0)+ISNULL(LRB.Charges5,0)+ISNULL(LRB.Charges6,0))) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN (SUM(ISNULL(LRB.Freight,0)+ISNULL(LRB.Charges1,0)+ISNULL(LRB.Charges2,0)+ISNULL(LRB.Charges3,0)+ISNULL(LRB.Charges4,0)+ISNULL(LRB.Charges5,0)+ISNULL(LRB.Charges6,0))) END DESC,			
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN SUM(LRB.InvoiceValue) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM(LRB.InvoiceValue) END DESC
		) AS RowNum,
		 Count(*) over () AS TotalCount 
		,CASE WHEN @SelectedView = @DateWise THEN CAST(LRB.LRDate AS VARCHAR(100)) WHEN @SelectedView = @PartyWise THEN CA1.Name END As GroupingColumn
		,COUNT(*) As LRNumber
		,SUM(Parcel) As Parcel
		,SUM(ChargeWeight) As ChargeWeight
		,SUM((ISNULL(LRB.Freight,0)+ISNULL(LRB.Charges1,0)+ISNULL(LRB.Charges2,0)+ISNULL(LRB.Charges3,0)+ISNULL(LRB.Charges4,0)+ISNULL(LRB.Charges5,0)+ISNULL(LRB.Charges6,0))) AS Amount
		,SUM([GSTRate].Rate) As Rate
		,SUM(LRB.InvoiceValue) As InvoiceValue
		,LRB.Deleted
		FROM [Z-LRBooking-Z] As LRB
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRB.BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LRB.AccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		LEFT JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		LEFT JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId
		WHERE [CustomerFirmBranch].Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
		AND LRB.YearId = @YearId 
		AND (@DateFrom IS NULL OR CAST(LRB.LRDate AS DATE) >= @DateFrom)
		AND (@DateTo IS NULL OR CAST(LRB.LRDate AS DATE) <= @DateTo)
		AND (@CityFromIds = '0' OR LRB.CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityFromIds)))
		AND (@CityToIds = '0' OR LRB.CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityToIds)))
		AND (@LRFrom = '0' OR LRB.LRNumber >= @LRFrom)
		AND (@LRTo = '0' OR LRB.LRNumber <= @LRTo)
		AND (@ConsignorIds = '0' OR LRB.AccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsignorIds)))
		AND (@ConsigneeIds = '0' OR LRB.DeliveryAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsigneeIds)))
		AND (@BillPartyIds = '0' OR LRB.BillAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BillPartyIds)))
		AND (@PvtMarkIds = '0' OR LRB.PrivateMarka IN (SELECT value FROM STRING_SPLIT(@PvtMarkIds, ',')))
		AND (@PayTypeIds = '0' OR LRB.LRPayTypeId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@PayTypeIds)))
		AND (
				@ChalanId = '0' 
				OR (@ChalanId = '1' AND LRB.Id IN ( SELECT LRBookingId FROM [Z-PurchaseBillMaster-Z] INNER JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillMaster-Z].ID = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-PurchaseBillDetail-Z].Deleted = 0))
				OR (@ChalanId = '2' AND LRB.Id NOT IN ( SELECT LRBookingId FROM [Z-PurchaseBillMaster-Z] INNER JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillMaster-Z].ID = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-PurchaseBillDetail-Z].Deleted = 0))
			)
		AND (
				@InvStatusId = '0'
				OR (@InvStatusId = '1' AND LRB.Id IN ( SELECT LRBookingId FROM [Z-SalesBillMaster-Z] INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].ID = [Z-SalesBillDetail-Z].SalesBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-SalesBillDetail-Z].Deleted = 0))
				OR (@InvStatusId = '2' AND LRB.Id NOT IN ( SELECT LRBookingId FROM [Z-SalesBillMaster-Z] INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].ID = [Z-SalesBillDetail-Z].SalesBillMasterId WHERE BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)) AND YearId = @YearId AND [Z-SalesBillDetail-Z].Deleted = 0))
			)
		AND (
				@LRStatusId = '0'
				OR (@LRStatusId = '1' AND LRB.Deleted = 0)
				OR (@LRStatusId = '2' AND LRB.Deleted = 1)
			)
        GROUP BY CASE WHEN @SelectedView = @DateWise THEN CAST(LRB.LRDate AS VARCHAR(100)) WHEN @SelectedView = @PartyWise THEN CA1.Name END, LRB.Deleted
    )

	SELECT * FROM CTE
    WHERE
        (Coalesce(@Search, '') = '' OR GroupingColumn LIKE '%' + @Search + '%'
                                   OR Parcel LIKE '%' + @Search + '%'
                                   OR ChargeWeight LIKE '%' + @Search + '%'
                                   OR Rate LIKE '%' + @Search + '%'
                                   OR InvoiceValue LIKE '%' + @Search + '%')
	AND @PageSize = -1 OR (RowNum > @PageStart AND RowNum < (@PageStart + (@PageSize + 1)))
    ORDER BY RowNum;
	
End
Set Nocount off;
GO
