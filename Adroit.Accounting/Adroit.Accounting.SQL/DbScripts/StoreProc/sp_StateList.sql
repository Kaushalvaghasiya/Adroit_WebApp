CREATE OR ALTER Procedure [dbo].[sp_StateList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [State].[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [State].[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [State].[TitleGSTR] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [State].[TitleGSTR] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [State].[TitleEWay] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [State].[TitleEWay] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [State].[Code] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [State].[Code] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Country].[Title] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Country].[Title] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [State].[Active] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [State].[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		[State].*,Country.Title as CountryName
		FROM [State]
			LEFT JOIN Country on Country.id=[State].countryId
		WHERE 
		 (Coalesce(@Search,'') = '' 
				OR [State].[Title] like '%'+ @Search + '%'
				OR [State].[TitleGSTR] like '%'+ @Search + '%' 
				OR [State].[TitleEWay] like '%'+ @Search + '%' 
				OR [State].[Code] like '%'+ @Search + '%' 
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;