CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingDailySummaryList]
  @LoginId INT,
  @LRStatusId INT,
  @BranchIds varchar(max),
  @DateFrom DATETIME,
  @DateTo DATETIME,
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

	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN LRB.LRDate END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN LRB.LRDate END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM(LRB.Parcel) END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM(LRB.Parcel) END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM(LRB.ChargeWeight) END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM(LRB.ChargeWeight) END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN SUM(CASE WHEN TLRType.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC'  THEN SUM(CASE WHEN TLRType.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC'  THEN SUM(CASE WHEN TLRType.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SUM(CASE WHEN TLRType.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) END DESC			
		) AS RowNum
		,Count(*) over () AS TotalCount 
		,LRB.LRDate
		,COUNT(*) As TotalLR
		,SUM(LRB.Parcel) As Parcel
		,SUM(LRB.ChargeWeight) As ChargeWeight
		,SUM(CASE WHEN TLRType.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS ToPayAmount
		,SUM(CASE WHEN TLRType.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS PaidAmount
		,SUM(CASE WHEN TLRType.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS TBBAmount		
		,LRB.Deleted
		FROM [Z-LRBooking-Z] As LRB
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRB.BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		LEFT JOIN TransportLRPayType AS TLRType ON LRB.LRPayTypeId = TLRType.Id
		WHERE LRB.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
		AND LRB.YearId = @YearId
		AND (
				@LRStatusId = '0'
				OR (@LRStatusId = '1' AND LRB.Deleted = 0)
				OR (@LRStatusId = '2' AND LRB.Deleted = 1)
			)
		AND (Coalesce(@Search,'') = '' OR LRB.LRDate like '%'+ @Search + '%'
									   --OR LRB.Parcel like '%'+ @Search + '%'
									   OR LRB.ChargeWeight like '%'+ @Search + '%')
		GROUP BY LRB.LRDate, LRB.Deleted
	 ) AS T   
	 WHERE @PageSize = -1 OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1)))
End
Set Nocount off;
GO
