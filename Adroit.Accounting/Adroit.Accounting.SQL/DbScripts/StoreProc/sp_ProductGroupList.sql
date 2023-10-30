CREATE OR ALTER Procedure [dbo].[sp_ProductGroupList]
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
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@LoginId);
	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN ProductGroup.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN ProductGroup.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ProductGroup.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ProductGroup.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ProductGroup.[Active] END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ProductGroup.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		ProductGroup.Id,ProductGroup.Title, ProductGroup.OrderNumber,ProductGroup.Active
		FROM ProductGroup
		WHERE CustomerId = @CustomerId
		And ProductGroup.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR ProductGroup.[Title] like '%'+ @Search + '%'
				OR ProductGroup.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO