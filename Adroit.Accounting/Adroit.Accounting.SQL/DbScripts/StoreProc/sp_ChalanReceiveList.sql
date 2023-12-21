CREATE OR ALTER Procedure [dbo].[sp_ChalanReceiveList]
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
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-ChalanReceive-Z].ReceiveDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-ChalanReceive-Z].ReceiveDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder = 'ASC' THEN
				ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
				(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
				+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0))
			END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder = 'DESC' THEN
				ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
				(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
				+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0))
			END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [City].Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [City].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-ChalanReceive-Z].Id
		,[Z-ChalanReceive-Z].BillNumberBranch
		,[Z-ChalanReceive-Z].ReceiveDate 
		,[City].Title As CityTo
		,ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
		(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
		+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0)) AS NetAmount 
		FROM [Z-ChalanReceive-Z]
		INNER JOIN [Z-PurchaseBillMaster-Z] on [Z-PurchaseBillMaster-Z].Id = [Z-ChalanReceive-Z].PurchaseBillMasterId AND [Z-ChalanReceive-Z].Deleted = 0
		LEFT JOIN [City] on [City].Id = [Z-PurchaseBillMaster-Z].CityIdTo AND [City].Active = 1
		WHERE [Z-ChalanReceive-Z].Deleted = 0 
			AND [Z-ChalanReceive-Z].FirmId = @FirmId
			AND [Z-ChalanReceive-Z].BranchId = @BranchId
			AND [Z-ChalanReceive-Z].YearId = @YearId			  
		AND (Coalesce(@Search,'') = '' OR [Z-ChalanReceive-Z].BillNumberBranch like '%'+ @Search + '%'
									   OR [Z-ChalanReceive-Z].ReceiveDate like '%'+ @Search + '%'
									   OR [City].Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
