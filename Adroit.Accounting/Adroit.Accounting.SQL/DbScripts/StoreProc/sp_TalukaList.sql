CREATE OR ALTER Procedure [dbo].[sp_TalukaList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Taluka.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Taluka.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Taluka.[Active] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Taluka.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		Taluka.*,
		District.Title as DistrictName
		FROM Taluka
		LEFT JOIN District on District.Id=Taluka.DistrictId
		WHERE 
		 (Coalesce(@Search,'') = '' 
				OR Taluka.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;