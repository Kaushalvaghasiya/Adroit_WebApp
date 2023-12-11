CREATE OR ALTER Procedure [dbo].[sp_CustomerInvoiceList]
  @loginId int,
  @firmId int,  
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [SerialNumberOfBranch].Code END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [SerialNumberOfBranch].Code END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [BillDate].Title END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [BillDate].Code END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [BillNumber].Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [BillNumber].Code END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, [Z-SalesBillMaster-Z].SerialNumberOfBranch as [BranchBill#],
		[Z-SalesBillMaster-Z].BillDate,[Z-SalesBillMaster-Z].BillNumber as [FirmBill#] 
		from [Z-SalesBillMaster-Z]
		  WHERE [Z-SalesBillMaster-Z].Deleted = 0
	  AND (Coalesce(@Search,'') = '' OR [Z-SalesBillMaster-Z].[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
