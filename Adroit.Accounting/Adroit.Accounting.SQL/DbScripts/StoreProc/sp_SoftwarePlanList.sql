CREATE OR ALTER Procedure [dbo].[sp_SoftwarePlanList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN SoftwarePlan.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN SoftwarePlan.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Software.[Title] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Software.[Title] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SoftwarePlan.[Business] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SoftwarePlan.[Business] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SoftwarePlan.[Code] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SoftwarePlan.[Code] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN SoftwarePlan.[Active] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN SoftwarePlan.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		SoftwarePlan.*,
		Software.Title As SoftwareName 
		FROM SoftwarePlan
		LEFT JOIN Software on SoftwarePlan.SoftwareId=Software.Id
		WHERE SoftwarePlan.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR SoftwarePlan.[Title] like '%'+ @Search + '%'
				OR Software.[Title] like '%'+ @Search + '%'
				OR SoftwarePlan.[Business] like '%'+ @Search + '%'  
				OR SoftwarePlan.[Code] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO