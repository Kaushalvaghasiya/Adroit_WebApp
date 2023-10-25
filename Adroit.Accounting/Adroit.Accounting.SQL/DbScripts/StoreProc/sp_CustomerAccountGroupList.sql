CREATE OR ALTER Procedure [dbo].[sp_CustomerAccountGroupList]
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
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccountGroup.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccountGroup.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerAccountGroupHeader.[Title] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerAccountGroupHeader.[Title] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN AccountGroupType.[Title] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN AccountGroupType.[Title] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerAccountGroup.[Code] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerAccountGroup.[Code] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerAccountGroup.[Active] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerAccountGroup.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		CustomerAccountGroup.*,
		CustomerAccountGroupHeader.Title As CustomerAccountGroupHeaderName,
		AccountGroupType.Title As MainAccountGroupName
		FROM CustomerAccountGroup
		LEFT JOIN AccountGroupType on AccountGroupType.Id=CustomerAccountGroup.TypeId
		LEFT JOIN CustomerAccountGroupHeader on CustomerAccountGroup.AccountGroupHeaderId=CustomerAccountGroupHeader.Id
		WHERE CustomerAccountGroup.Deleted = 0 And CustomerAccountGroup.CustomerId = @CustomerId
		AND (Coalesce(@Search,'') = '' 
				OR CustomerAccountGroup.[Title] like '%'+ @Search + '%'
				OR CustomerAccountGroupHeader.[Title] like '%'+ @Search + '%'
				OR AccountGroupType.[Title] like '%'+ @Search + '%'  
				OR CustomerAccountGroup.[Code] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO