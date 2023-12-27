CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingBookingRegisterReportList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRNumber END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRNumber END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].LRDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].LRDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].Parcel END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].Parcel END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [TransportDesc].Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [TransportDesc].Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].ChargeWeight END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN (ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN [GSTRate].Rate END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN [GSTRate].Rate END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN [Z-LRBooking-Z].InvoiceValue END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN [Z-LRBooking-Z].InvoiceValue END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN [TransportLRPayType].Title END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' THEN [TransportLRPayType].Title END DESC,
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN 'Static' END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN 'Static' END DESC,
			CASE WHEN @SortColumn = 14 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 14 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-LRBooking-Z].LRNumber 
		,[Z-LRBooking-Z].LRDate 
		,CT2.Title As CityTo
		,[Z-LRBooking-Z].Parcel 
		,[TransportDesc].[Title] AS Description
		,CONCAT(ISNULL(CA1.Name, ''),NULLIF(' | ' + ISNULL(CA1.GSTNumber, ''), ' | ')) AS Consignor
		,CONCAT(ISNULL(CA2.Name, ''),NULLIF(' | ' + ISNULL(CA2.GSTNumber, ''), ' | ')) AS Consignee
		,[Z-LRBooking-Z].ChargeWeight 
		,(ISNULL([Z-LRBooking-Z].Freight,0)+ISNULL([Z-LRBooking-Z].Charges1,0)+ISNULL([Z-LRBooking-Z].Charges2,0)+ISNULL([Z-LRBooking-Z].Charges3,0)+ISNULL([Z-LRBooking-Z].Charges4,0)+ISNULL([Z-LRBooking-Z].Charges5,0)+ISNULL([Z-LRBooking-Z].Charges6,0)) AS Amount
		,[GSTRate].Rate As Rate
		,[GSTRate].Rate As GSTAmount
		,[Z-LRBooking-Z].InvoiceValue
		,[TransportLRPayType].Title As LRPayType
		,'STATIC' As LoadingChalanNo
		,[CustomerFirmBranch].Title As BranchName
		FROM [Z-LRBooking-Z]
		INNER JOIN [City] AS CT2 on CT2.Id = [Z-LRBooking-Z].CityIdTo
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId AND CAB1.BranchId = @BranchId
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId 
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId AND CAB2.BranchId = @BranchId
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.CustomerId = @CustomerId 
		LEFT JOIN [TransportDesc] ON [Z-LRBooking-Z].[DescriptionId] = [TransportDesc].[Id] AND [TransportDesc].[CustomerId] = @CustomerId
		LEFT JOIN [TransportLRPayType] ON [Z-LRBooking-Z].[LRPayTypeId] = [TransportLRPayType].[Id]
		WHERE [Z-LRBooking-Z].BranchId = @BranchId AND [Z-LRBooking-Z].YearId = @YearId
		AND (Coalesce(@Search,'') = '' OR [Z-LRBooking-Z].LRNumber like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].LRDate like '%'+ @Search + '%'
									   OR CT2.Title like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].Parcel like '%'+ @Search + '%'
									   OR [TransportDesc].Title like '%'+ @Search + '%'
									   OR CA1.Name like '%'+ @Search + '%'
									   OR CA2.Name like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].ChargeWeight like '%'+ @Search + '%'
									   OR [GSTRate].Rate like '%'+ @Search + '%'
									   OR [Z-LRBooking-Z].InvoiceValue like '%'+ @Search + '%'
									   OR [TransportLRPayType].Title like '%'+ @Search + '%'
									   OR [CustomerFirmBranch].Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
