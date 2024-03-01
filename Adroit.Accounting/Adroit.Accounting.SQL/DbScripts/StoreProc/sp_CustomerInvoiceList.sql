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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN SalesBillMaster.SerialNumberOfBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN SalesBillMaster.SerialNumberOfBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN SalesBillMaster.BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN SalesBillMaster.BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerAccount.GSTNumber END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerAccount.GSTNumber END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN SalesBillMaster.BillAmount END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN SalesBillMaster.BillAmount END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN SalesBillMaster.BillNumber END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SalesBillMaster.BillNumber END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,SalesBillMaster.Id
		,SalesBillMaster.SerialNumberOfBranch As SerialNumberOfBranch
		,SalesBillMaster.BillDate As BillDate
		,CustomerAccount.Name As BillPartyName
		,[GSTRate].Rate As Rate
		,SalesBillMaster.BillNumber As BillNumber
		,SalesBillMaster.BillAmount	 
		,CT1.Title As City
		,CustomerAccount.GSTNumber As GSTNo
		,SalesBillMaster.Deleted
		FROM [Z-SalesBillMaster-Z] AS SalesBillMaster
		INNER JOIN CustomerAccountBranchMapping on CustomerAccountBranchMapping.Id = SalesBillMaster.AccountBranchMappingId 
		INNER JOIN CustomerAccount on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId AND CustomerAccount.CustomerId = @CustomerId 
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = SalesBillMaster.BranchId 
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId
		LEFT JOIN [City] AS CT1 on CT1.Id = CustomerAccount.CityId 
		WHERE SalesBillMaster.FirmId = @FirmId
			AND SalesBillMaster.BranchId = @BranchId
			AND SalesBillMaster.YearId = @YearId
			AND (Coalesce(@Search,'') = '' OR SalesBillMaster.SerialNumberOfBranch like '%'+ @Search + '%'
									OR SalesBillMaster.BillDate like '%'+ @Search + '%'
									OR CustomerAccount.Name like '%'+ @Search + '%'
									OR CustomerAccount.GSTNumber like '%'+ @Search + '%'
									OR SalesBillMaster.BillAmount like '%'+ @Search + '%'
									OR CT1.Title like '%'+ @Search + '%'
									OR SalesBillMaster.BillNumber like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
