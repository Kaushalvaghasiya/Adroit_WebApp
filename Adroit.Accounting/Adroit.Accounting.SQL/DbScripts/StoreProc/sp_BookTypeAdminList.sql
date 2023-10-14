CREATE OR ALTER Procedure [dbo].[sp_BookTypeAdminList]
  @LoginId int,
  @FirmId int,  
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN BookTypeAdmin.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN BookTypeAdmin.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN BookTypeAdmin.[Active] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN BookTypeAdmin.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		BookTypeAdmin.*
		FROM BookTypeAdmin
		WHERE BookTypeAdmin.IsDeleted = 0
		AND (Coalesce(@Search,'') = '' OR BookTypeAdmin.[Title] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO