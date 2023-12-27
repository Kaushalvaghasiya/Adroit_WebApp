CREATE OR ALTER Procedure [dbo].[sp_LRBookingLRRegisterReportList]
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
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRDate END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRDate END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRNumber END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [TransportDesc].Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [TransportDesc].Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN [TransportPacking].Title END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN [TransportPacking].Title END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].PrivateMarka END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].PrivateMarka END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].InvoiceValue END DESC,
			CASE WHEN @SortColumn = 14 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 14 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
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
		INNER JOIN [City] AS CT1 on CT1.Id = [Z-LRBooking-Z].CityIdFrom
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
		INNER JOIN [TransportLRPayType] on TransportLRPayType.Id = [Z-LRBooking-Z].LRPayTypeId
		LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId
		LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId
		WHERE [Z-LRBooking-Z].BranchId = @BranchId AND [Z-LRBooking-Z].YearId = @YearId
		AND (Coalesce(@Search,'') = '' OR [Z-LRBooking-Z].LRDate like '%'+ @Search + '%'
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
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
