CREATE OR ALTER Procedure [dbo].[sp_ProductFabricList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN ProductFabric.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN ProductFabric.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ProductFabric.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ProductFabric.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ProductFabric.[Active] END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ProductFabric.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		ProductFabric.Id,ProductFabric.Title, ProductFabric.OrderNumber,ProductFabric.Active
		FROM ProductFabric
		WHERE CustomerId = @CustomerId
		And ProductFabric.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR ProductFabric.[Title] like '%'+ @Search + '%'
				OR ProductFabric.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO