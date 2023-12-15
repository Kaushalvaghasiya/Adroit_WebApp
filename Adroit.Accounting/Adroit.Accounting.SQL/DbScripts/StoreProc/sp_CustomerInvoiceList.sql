CREATE OR ALTER Procedure [dbo].[sp_CustomerInvoiceList]
  @LoginId INT,
  @FirmId INT,
  @BranchId INT,
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerAccount.GSTNumber END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerAccount.GSTNumber END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].BillAmount END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].BillAmount END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].BillNumber END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].BillNumber END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-SalesBillMaster-Z].Id
		,[Z-SalesBillMaster-Z].SerialNumberOfBranch As SerialNumberOfBranch
		,[Z-SalesBillMaster-Z].BillDate As BillDate
		,CustomerAccount.Name As BillPartyName
		,[GSTRate].Rate As Rate
		,[Z-SalesBillMaster-Z].BillNumber As BillNumber
		,[Z-SalesBillMaster-Z].BillAmount	 
		,CT1.Title As City
		,CustomerAccount.GSTNumber As GSTNo
		FROM [Z-SalesBillMaster-Z]
		INNER JOIN CustomerAccountBranchMapping on CustomerAccountBranchMapping.Id = [Z-SalesBillMaster-Z].AccountBranchMappingId AND CustomerAccountBranchMapping.Deleted = 0
		INNER JOIN CustomerAccount on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId AND CustomerAccount.CustomerId = @CustomerId AND CustomerAccount.Deleted = 0 AND CustomerAccount.Active = 1
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-SalesBillMaster-Z].BranchId AND [CustomerFirmBranch].Deleted = 0 AND [CustomerFirmBranch].Active = 1 
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales AND [Product].Deleted = 0 AND [Product].Active = 1
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId AND [GSTRate].Deleted = 0 AND [GSTRate].Active = 1
		LEFT JOIN [City] AS CT1 on CT1.Id = [Z-SalesBillMaster-Z].ToStationCityId AND CT1.Active = 1
		WHERE [Z-SalesBillMaster-Z].Deleted = 0
			  AND [Z-SalesBillMaster-Z].FirmId = @FirmId
			  AND [Z-SalesBillMaster-Z].BranchId = @BranchId
			  AND [Z-SalesBillMaster-Z].YearId = @YearId
	  AND (Coalesce(@Search,'') = '' OR [Z-SalesBillMaster-Z].SerialNumberOfBranch like '%'+ @Search + '%'
									 OR [Z-SalesBillMaster-Z].BillDate like '%'+ @Search + '%'
									 OR CustomerAccount.Name like '%'+ @Search + '%'
									 OR CustomerAccount.GSTNumber like '%'+ @Search + '%'
									 OR [Z-SalesBillMaster-Z].BillAmount like '%'+ @Search + '%'
									 OR CT1.Title like '%'+ @Search + '%'
									 OR [Z-SalesBillMaster-Z].BillNumber like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
