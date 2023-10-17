CREATE OR ALTER Procedure [dbo].[sp_ProductAmtCalcOnList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN ProductAmtCalcOn.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN ProductAmtCalcOn.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Software.[Title] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Software.[Title] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ProductAmtCalcOn.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ProductAmtCalcOn.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN ProductAmtCalcOn.[Active] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN ProductAmtCalcOn.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		ProductAmtCalcOn.*,
		Software.Title As SoftwareName 
		FROM ProductAmtCalcOn
		LEFT JOIN Software on ProductAmtCalcOn.SoftwareId=Software.Id
		WHERE ProductAmtCalcOn.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR ProductAmtCalcOn.[Title] like '%'+ @Search + '%'
				OR Software.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO