CREATE OR ALTER Procedure [dbo].[sp_AccountGroupAdminList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN AccountGroupAdmin.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN AccountGroupAdmin.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN AccountGroupHeaderAdmin.[Title] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN AccountGroupHeaderAdmin.[Title] END DESC,
			--CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN AccountGroupAdmin.[Business] END ASC,  
			--CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN AccountGroupAdmin.[Business] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN AccountGroupAdmin.[Code] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN AccountGroupAdmin.[Code] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN AccountGroupAdmin.[Active] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN AccountGroupAdmin.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		AccountGroupAdmin.*,
		AccountGroupHeaderAdmin.Title As AccountGroupHeaderAdminName 
		FROM AccountGroupAdmin
		LEFT JOIN AccountGroupHeaderAdmin on AccountGroupAdmin.AccountGroupHeaderId=AccountGroupHeaderAdmin.Id
		WHERE AccountGroupAdmin.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR AccountGroupAdmin.[Title] like '%'+ @Search + '%'
				OR AccountGroupHeaderAdmin.[Title] like '%'+ @Search + '%'
				--OR AccountGroupAdmin.[Business] like '%'+ @Search + '%'  
				OR AccountGroupAdmin.[Code] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO