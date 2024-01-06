CREATE OR ALTER Procedure [dbo].[sp_CustomerGeneralExpensesMultiList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillNumberBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillNumberBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerAccount.GSTNumber END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerAccount.GSTNumber END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillAmount END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillAmount END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillNumberFirm END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillNumberFirm END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-PurchaseBillMaster-Z].Id
		,[Z-PurchaseBillMaster-Z].BillNumberBranch 
		,[Z-PurchaseBillMaster-Z].BillDate 
		,CustomerAccount.Name As BillPartyName
		,[Z-PurchaseBillMaster-Z].BillNumberFirm 
		,[Z-PurchaseBillMaster-Z].BillAmount 
		,CT1.Title As CityTo
		,CustomerAccount.GSTNumber As GSTNo
		FROM [Z-PurchaseBillMaster-Z]
		INNER JOIN CustomerAccountBranchMapping on CustomerAccountBranchMapping.Id = [Z-PurchaseBillMaster-Z].AccountBranchMappingId AND CustomerAccountBranchMapping.Deleted = 0
		INNER JOIN CustomerAccount on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId AND CustomerAccount.CustomerId = @CustomerId AND CustomerAccount.Deleted = 0 AND CustomerAccount.Active = 1
		LEFT JOIN [City] AS CT1 on CT1.Id = [Z-PurchaseBillMaster-Z].BranchIdTo AND CT1.Active = 1
		WHERE [Z-PurchaseBillMaster-Z].Deleted = 0
			  AND [Z-PurchaseBillMaster-Z].FirmId = @FirmId
			  AND [Z-PurchaseBillMaster-Z].BranchId = @BranchId
			  AND [Z-PurchaseBillMaster-Z].YearId = @YearId
	  AND (Coalesce(@Search,'') = '' OR [Z-PurchaseBillMaster-Z].BillNumberBranch like '%'+ @Search + '%'
									 OR [Z-PurchaseBillMaster-Z].BillDate like '%'+ @Search + '%'
									 OR CustomerAccount.Name like '%'+ @Search + '%'
									 OR CustomerAccount.GSTNumber like '%'+ @Search + '%'
									 OR [Z-PurchaseBillMaster-Z].BillAmount like '%'+ @Search + '%'
									 OR CT1.Title like '%'+ @Search + '%'
									 OR [Z-PurchaseBillMaster-Z].BillNumberFirm like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
