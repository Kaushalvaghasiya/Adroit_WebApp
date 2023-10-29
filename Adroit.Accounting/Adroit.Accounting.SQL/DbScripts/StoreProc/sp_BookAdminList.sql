CREATE OR ALTER     Procedure [dbo].[sp_BookAdminList]
(
  @LoginId int,
  @FirmId int,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
)
As
Set Nocount on;
Begin
	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
	   CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN AccountAdmin.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN AccountAdmin.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN BookTypeAdmin.Title END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN BookTypeAdmin.Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN BookAdmin.BookShortName END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN BookAdmin.BookShortName END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN BookAdmin.BillNoPrefix END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN BookAdmin.BillNoPrefix END DESC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN BookAdmin.BillNoPostFix END ASC,  
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN BookAdmin.BillNoPostFix END DESC
		) AS RowNum,
	   Count(*) over () AS TotalRows, BookAdmin.*, AccountAdmin.[Name] as [BookName], AccountAdmin.PrintName as [ShortName],
	   BookTypeAdmin.Title as BookType
	  FROM BookAdmin
	  LEFT JOIN AccountAdmin on BookAdmin.BookAccountId = [AccountAdmin].Id
	  LEFT JOIN BookTypeAdmin on BookAdmin.BookTypeId = BookTypeAdmin.Id
	  WHERE BookAdmin.Deleted = 0
	  AND (Coalesce(@Search,'') = '' OR AccountAdmin.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO