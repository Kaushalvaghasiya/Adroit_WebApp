CREATE OR ALTER Procedure [dbo].[sp_GSTCollectionList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN GSTCollection.[GSTNumber] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN GSTCollection.[GSTNumber] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTCollection.[Name] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTCollection.[Name] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTCollection.[Address1] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTCollection.[Address1] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTCollection.[City] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTCollection.[City] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTCollection.[Pincode] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTCollection.[Pincode] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN GSTCollection.[Active] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN GSTCollection.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		GSTCollection.*
		FROM GSTCollection
		WHERE (Coalesce(@Search,'') = '' 
				OR GSTCollection.[GSTNumber] like '%'+ @Search + '%'
				OR GSTCollection.[Name] like '%'+ @Search + '%'  
				OR GSTCollection.[Address1] like '%'+ @Search + '%'  
				OR GSTCollection.[City] like '%'+ @Search + '%'  
				OR GSTCollection.[Pincode] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO