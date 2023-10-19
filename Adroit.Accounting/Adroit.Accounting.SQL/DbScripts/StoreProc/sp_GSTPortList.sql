CREATE OR ALTER Procedure [dbo].[sp_GSTPortList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN GSTPort.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN GSTPort.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTPort.[Code] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTPort.[Code] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN GSTPort.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN GSTPort.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN GSTPort.[Active] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN GSTPort.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		GSTPort.*
		FROM GSTPort
		WHERE (Coalesce(@Search,'') = '' 
				OR GSTPort.[Title] like '%'+ @Search + '%'
				OR GSTPort.[Code] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO