CREATE OR ALTER Procedure [dbo].[sp_LRBookingList]
  @LoginId INT,
  @BranchId INT,
  @FirmId INT,
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
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CA1.Name END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CA1.Name END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ActualWeight END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ActualWeight END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN CA2.Name END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN CA2.Name END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN CA3.Name END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN CA3.Name END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-LRBooking-Z].*
		,CA1.Name As Consignor
		,(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) AS Amount
		,CT2.Title As CityTo
		,[TransportLRPayType].Title As Type
		,CA2.Name As Consignee
		,CA3.Name As BillParty
		FROM [Z-LRBooking-Z]
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId
		INNER JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId
		INNER JOIN [CustomerAccount] AS CA3 on CA2.Id = CAB3.AccountId
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [TransportLRPayType] on TransportLRPayType.Id = [Z-LRBooking-Z].LRPayTypeId
		WHERE [Z-LRBooking-Z].Deleted = 0 AND [Z-LRBooking-Z].BranchId = @BranchId
		AND (Coalesce(@Search,'') = '' OR [Z-LRBooking-Z].EwayBillNo like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
