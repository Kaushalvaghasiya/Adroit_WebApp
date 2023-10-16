CREATE OR ALTER   Procedure [dbo].[sp_DistrictList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN District.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN District.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [State].[Title] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [State].[Title] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN Country.[Title] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN Country.[Title] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN District.[Active] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN District.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		District.*,
		State.Title as StateName,
		Country.Title as CountryName
		FROM District
		LEFT JOIN State on State.Id=District.StateId
		LEFT JOIN Country on Country.Id=State.CountryId
		WHERE 
		 (Coalesce(@Search,'') = '' 
				OR District.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;