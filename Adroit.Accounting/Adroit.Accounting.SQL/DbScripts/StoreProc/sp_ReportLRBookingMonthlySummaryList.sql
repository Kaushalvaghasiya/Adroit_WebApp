CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingMonthlySummaryList]
  @LoginId INT,
  @BranchIds varchar(max),
  @FirmId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	WITH CTE AS (
        SELECT
            ROW_NUMBER() OVER 
            (ORDER BY
                CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN DATENAME(MONTH, MIN(LRB.LRDate)) END ASC,  
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN DATENAME(MONTH, MIN(LRB.LRDate)) END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM(LRB.Parcel) END ASC,  
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM(LRB.Parcel) END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM(LRB.ChargeWeight) END ASC,  
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM(LRB.ChargeWeight) END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC'  THEN SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC'  THEN SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN MAX([GSTRate].Rate) END ASC,  
				CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN MAX([GSTRate].Rate) END DESC,				
				CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN SUM(LRB.InvoiceValue) END ASC,  
				CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN SUM(LRB.InvoiceValue) END DESC,
				CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN MAX([CustomerFirmBranch].Title) END ASC,  
				CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN MAX([CustomerFirmBranch].Title) END DESC
            ) AS RowNum
            , COUNT(*) OVER () AS TotalCount 
            , DATENAME(MONTH, MIN(LRB.LRDate)) AS LRMonth
            , COUNT(*) AS TotalLR
            , SUM(LRB.Parcel) AS Parcel
            , SUM(LRB.ChargeWeight) AS ChargeWeight
            , SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS ToPayAmount
            , SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS PaidAmount
            , SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS TBBAmount
            , MAX([GSTRate].Rate) AS Rate
            , MAX([GSTRate].Rate) AS GSTAmount
            , SUM(LRB.InvoiceValue) AS InvoiceValue
            , MAX([CustomerFirmBranch].Title) AS BranchName
        FROM [Z-LRBooking-Z] AS LRB
        INNER JOIN [CustomerFirmBranch] ON [CustomerFirmBranch].Id = LRB.BranchId
        INNER JOIN [CustomerFirmTransportSetting] ON [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
        INNER JOIN [Product] ON [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
        INNER JOIN [GSTRate] ON [GSTRate].Id = [Product].GSTRateId 
        LEFT JOIN TransportLRPayType AS TLRType1 ON LRB.LRPayTypeId = TLRType1.Id AND TLRType1.Title = 'To Pay'
        LEFT JOIN TransportLRPayType AS TLRType2 ON LRB.LRPayTypeId = TLRType2.Id AND TLRType2.Title = 'Paid'
        LEFT JOIN TransportLRPayType AS TLRType3 ON LRB.LRPayTypeId = TLRType3.Id AND TLRType3.Title = 'TBB'
        WHERE LRB.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
        AND LRB.YearId = @YearId
        GROUP BY MONTH(LRB.LRDate)
    )

	SELECT * FROM CTE
    WHERE
        ((@PageSize = -1 AND 1 = 1) OR (RowNum > @PageStart AND RowNum < (@PageStart + (@PageSize + 1))))
        AND (Coalesce(@Search, '') = '' OR LRMonth LIKE '%' + @Search + '%'
                                   OR Parcel LIKE '%' + @Search + '%'
                                   OR ChargeWeight LIKE '%' + @Search + '%'
                                   OR Rate LIKE '%' + @Search + '%'
                                   OR InvoiceValue LIKE '%' + @Search + '%'
                                   OR BranchName LIKE '%' + @Search + '%')
    ORDER BY RowNum; 
	
End
Set Nocount off;
GO
