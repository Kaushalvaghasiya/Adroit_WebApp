CREATE OR ALTER Procedure [dbo].[sp_CustomerBookList]
(
  @LoginId INT,
  @BranchId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
)
As
Set Nocount on;
Begin

	DECLARE @FirmId int = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId) 
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
	   CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN BookTypeAdmin.Title END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN BookTypeAdmin.Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerBook.BookShortName END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerBook.BookShortName END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerBook.BillNoPrefix END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerBook.BillNoPrefix END DESC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerBook.BillNoPostFix END ASC,  
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerBook.BillNoPostFix END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, CustomerBook.*, CustomerAccount.[Name] as [BookName], CustomerAccount.PrintName as [ShortName],
	   BookTypeAdmin.Title as BookType
	  FROM CustomerBook
	  LEFT JOIN CustomerAccount on CustomerBook.BookAccountId = [CustomerAccount].Id AND CustomerAccount.CustomerId = @CustomerId 
	  LEFT JOIN BookTypeAdmin on CustomerBook.BookTypeId = BookTypeAdmin.Id
	  WHERE CustomerBook.Deleted = 0 AND CustomerBook.OwnerBranchId = @BranchId AND CustomerBook.CustomerId = @CustomerId
	  AND (Coalesce(@Search,'') = '' OR CustomerAccount.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO