CREATE OR ALTER Procedure [dbo].[sp_Z_LRBooking_ZList]
  @BranchId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRNumber END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].EwayBillNo END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].EwayBillNo END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CA1.Name END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CA1.Name END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CA2.Name END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CA2.Name END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-LRBooking-Z].*
		,CA1.Name As Consignor
		,CA2.Name As Consignee
		,CT1.Title As CityFrom
		,CT2.Title As CityTo
		FROM [Z-LRBooking-Z]
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId
		INNER JOIN [City] AS CT1 on CT1.Id = [Z-LRBooking-Z].CityIdFrom
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		WHERE [Z-LRBooking-Z].Deleted = 0 AND [Z-LRBooking-Z].BranchId = @BranchId
		AND (Coalesce(@Search,'') = '' OR [Z-LRBooking-Z].EwayBillNo like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
