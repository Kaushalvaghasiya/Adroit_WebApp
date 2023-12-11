CREATE OR ALTER Procedure [dbo].[sp_CustomerInvoiceList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].SerialNumberOfBranch END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [Z-SalesBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [Z-SalesBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CustomerAccount.Name END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CustomerAccount.Name END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-SalesBillMaster-Z].SerialNumberOfBranch As SerialNumberOfBranch
		,[Z-SalesBillMaster-Z].BillDate As BillDate
		,CustomerAccount.Name As BillParty
		,[Z-SalesBillMaster-Z].BillNumber As BillNumber
		FROM [Z-SalesBillMaster-Z]
		INNER JOIN CustomerAccountBranchMapping on CustomerAccountBranchMapping.Id = [Z-SalesBillMaster-Z].AccountBranchMappingId AND CustomerAccountBranchMapping.Deleted = 0
		INNER JOIN CustomerAccount on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId AND CustomerAccount.Deleted = 0 AND CustomerAccount.Active = 1
		WHERE [Z-SalesBillMaster-Z].Deleted = 0
	  AND (Coalesce(@Search,'') = '' OR [Z-SalesBillMaster-Z].SerialNumberOfBranch like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
