CREATE OR ALTER Procedure [dbo].[sp_TransportDescAdminList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN TransportDescAdmin.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN TransportDescAdmin.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN TransportDescAdmin.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN TransportDescAdmin.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN TransportDescAdmin.[Active] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN TransportDescAdmin.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		TransportDescAdmin.*
		FROM TransportDescAdmin
		WHERE TransportDescAdmin.Deleted = 0
		AND (Coalesce(@Search,'') = '' OR TransportDescAdmin.[Title] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO