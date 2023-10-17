CREATE OR ALTER Procedure [dbo].[sp_BusinessList]
(
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
)
As
Set Nocount on;
Begin
	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Business.[Title] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Business.[Title] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN dbo.fn_GetBusinessSoftwareName (Business.Id) END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN dbo.fn_GetBusinessSoftwareName (Business.Id) END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN Business.[OrderNumber] END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN Business.[OrderNumber] END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN Business.[Active] END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN Business.[Active] END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   Business.* ,
	   dbo.fn_GetBusinessSoftwareName (Business.Id) As SoftwareName
	  FROM Business
	  WHERE Deleted = 0
	  AND (Coalesce(@Search,'') = '' 
			OR Business.[Title] like '%'+ @Search + '%'
			OR dbo.fn_GetBusinessSoftwareName (Business.Id) like '%'+ @Search + '%'
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO