CREATE OR ALTER Procedure [dbo].[sp_CustomerGeneralExpensesMultiList]
  @branchId INT,
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].Id END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].Id END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].EwayBillNumber END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].EwayBillNumber END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CA1.Name END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CA1.Name END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN CA2.Name END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN CA2.Name END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-PurchaseBillMaster-Z].*
		,[CustomerFirmBranch].Title AS Branch
		,CT1.Title As CityTo
		,CT2.Title As CityFrom
		,CA1.Name As Consignor
		,CA2.Name As Consignee
		FROM [Z-PurchaseBillMaster-Z]
		LEFT JOIN [City] AS CT1 on CT1.Id = [Z-PurchaseBillMaster-Z].CityIdTo AND CT1.Active = 1
		LEFT JOIN [City] AS CT2 on CT2.Id = [Z-PurchaseBillMaster-Z].CityIdFrom AND CT2.Active = 1
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-PurchaseBillMaster-Z].AccountBranchMappingId AND CAB1.Deleted = 0
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
		INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-PurchaseBillMaster-Z].DeliveryBranchId AND CAB2.Deleted = 0
		INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.Deleted = 0 AND CA2.Active = 1
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-PurchaseBillMaster-Z].BranchId AND [CustomerFirmBranch].Deleted = 0 AND [CustomerFirmBranch].Active = 1
		WHERE [Z-PurchaseBillMaster-Z].Deleted = 0 
		AND [Z-PurchaseBillMaster-Z].BranchId = @branchId
		AND (Coalesce(@Search,'') = '' OR [Z-PurchaseBillMaster-Z].EwayBillNumber like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
