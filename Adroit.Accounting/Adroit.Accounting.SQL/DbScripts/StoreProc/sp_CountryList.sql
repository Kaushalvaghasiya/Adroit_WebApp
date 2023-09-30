CREATE OR ALTER     Procedure [dbo].[sp_CountryList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Country.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Country.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Country.[PhoneCode] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Country.[PhoneCode] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		Country.*
		FROM Country
		WHERE 
		 (Coalesce(@Search,'') = '' 
				OR Country.[Title] like '%'+ @Search + '%'
				OR Country.[PhoneCode] like '%'+ @Search + '%'  
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;