CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingStockRegisterListWithSummary]
  @LoginId INT,
  @FirmId INT,
  @BranchIds NVARCHAR(MAX),
  @DateFrom NVARCHAR(MAX),
  @DateTo NVARCHAR(MAX),
  @CityFromIds NVARCHAR(MAX),
  @CityToIds NVARCHAR(MAX),
  @ConsignorIds NVARCHAR(MAX),
  @ConsigneeIds NVARCHAR(MAX),
  @BillPartyIds NVARCHAR(MAX),
  @PayTypeIds NVARCHAR(MAX),
  @ChalanId INT,
  @InvStatusId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	WITH CTE AS (
        SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM(LBR.Parcel) END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM(LBR.Parcel) END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM(LBR.ChargeWeight) END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM(LBR.ChargeWeight) END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN (SUM(ISNULL(LBR.Freight,0)+ISNULL(LBR.Charges1,0)+ISNULL(LBR.Charges2,0)+ISNULL(LBR.Charges3,0)+ISNULL(LBR.Charges4,0)+ISNULL(LBR.Charges5,0)+ISNULL(LBR.Charges6,0))) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN (SUM(ISNULL(LBR.Freight,0)+ISNULL(LBR.Charges1,0)+ISNULL(LBR.Charges2,0)+ISNULL(LBR.Charges3,0)+ISNULL(LBR.Charges4,0)+ISNULL(LBR.Charges5,0)+ISNULL(LBR.Charges6,0))) END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN SUM([GSTRate].Rate) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM([GSTRate].Rate) END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN SUM(LBR.InvoiceValue) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SUM(LBR.InvoiceValue) END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN MAX([CustomerFirmBranch].Title) END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN MAX([CustomerFirmBranch].Title) END DESC
		) AS RowNum,
		 Count(*) over () AS TotalCount 
		,COUNT(*) As LRNumber
		,SUM(Parcel) As Parcel
		,SUM(ChargeWeight) As ChargeWeight
		,SUM((ISNULL(LBR.Freight,0)+ISNULL(LBR.Charges1,0)+ISNULL(LBR.Charges2,0)+ISNULL(LBR.Charges3,0)+ISNULL(LBR.Charges4,0)+ISNULL(LBR.Charges5,0)+ISNULL(LBR.Charges6,0))) AS Amount
		,SUM([GSTRate].Rate) As Rate
		,SUM(LBR.InvoiceValue) As InvoiceValue
		,MAX([CustomerFirmBranch].Title) As BranchName
		FROM [Z-LRBooking-Z] As LBR
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LBR.BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = LBR.AccountBranchMappingId 
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		WHERE LBR.YearId = @YearId 
		
		AND 
		(
			(
				(@BranchIds = '0' OR LBR.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds)))
			)
			AND
			(
				(@DateFrom = '0' OR CONVERT(DATE, LBR.LRDate) >= 
					CASE 
						WHEN @DateFrom = '0' THEN '19000101' 
						ELSE CONVERT(DATE, @DateFrom)
					END
				)
			)
			AND
			(
				(@DateTo = '0' OR CONVERT(DATE, LBR.LRDate) <= 
					CASE 
						WHEN @DateTo = '0' THEN '99991231' 
						ELSE CONVERT(DATE, @DateTo)
					END
				)
			)
			AND
			(
				(@CityFromIds = '0' OR LBR.CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityFromIds)))
			)
			AND
			(
				(@CityToIds = '0' OR LBR.CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityToIds)))
			)
			
			AND
			(
				(@ConsignorIds = '0' OR LBR.AccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsignorIds)))
			)
			AND
			(
				(@ConsigneeIds = '0' OR LBR.DeliveryAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@ConsigneeIds)))
			)
			AND
			(
				(@BillPartyIds = '0' OR LBR.BillAccountBranchMappingId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BillPartyIds)))
			)
			
			AND
			(
				(@PayTypeIds = '0' OR LBR.LRPayTypeId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@PayTypeIds)))
			)
			AND
			(
				(
					@ChalanId = '0'
					OR
					(
						@ChalanId = '1' AND LBR.Id IN ( SELECT LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE Deleted = 0 )
					)
					OR
					(
						@ChalanId = '2' AND LBR.Id NOT IN ( SELECT LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE Deleted = 0 )
					)
				)
			)
			AND
			(
				(
					@InvStatusId = '0'
					OR
					(
						@InvStatusId = '1' AND LBR.Id IN ( SELECT LRBookingId FROM [Z-SalesBillDetail-Z] WHERE Deleted = 0 )
					)
					OR
					(
						@InvStatusId = '2' AND LBR.Id NOT IN ( SELECT LRBookingId FROM [Z-SalesBillDetail-Z] WHERE Deleted = 0 )
					)
				)
			)
		)
    )
	
	SELECT * FROM CTE
    WHERE
        ((@PageSize = -1 AND 1 = 1) OR (RowNum > @PageStart AND RowNum < (@PageStart + (@PageSize + 1))))
        AND (Coalesce(@Search, '') = '' OR LRNumber LIKE '%' + @Search + '%'
                                   OR Parcel LIKE '%' + @Search + '%'
                                   OR ChargeWeight LIKE '%' + @Search + '%'
                                   OR Rate LIKE '%' + @Search + '%'
                                   OR InvoiceValue LIKE '%' + @Search + '%'
                                   OR BranchName LIKE '%' + @Search + '%')
    ORDER BY RowNum;
	
End
Set Nocount off;
GO