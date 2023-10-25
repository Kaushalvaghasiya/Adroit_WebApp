CREATE OR ALTER Procedure [dbo].[sp_AccountAdminList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN AccountAdmin.[Name] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN AccountAdmin.[Name] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [AccountGroupAdmin].Title END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [AccountGroupAdmin].Title END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN AccountAdmin.[GSTNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN AccountAdmin.[GSTNumber] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [City].Title END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [City].Title END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN AccountAdmin.[Mobile] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN AccountAdmin.[Mobile] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		AccountAdmin.*,
		[AccountGroupAdmin].Title as AccountGroupName, [City].Title as CityName
		FROM AccountAdmin
			 INNER JOIN [AccountGroupAdmin] on AccountAdmin.AccountGroupId = [AccountGroupAdmin].Id
			 LEFT JOIN [City] on AccountAdmin.CityId = [City].Id
		WHERE AccountAdmin.Deleted = 0
		AND (Coalesce(@Search,'') = '' OR AccountAdmin.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO