CREATE OR ALTER Procedure [dbo].[sp_ProductPackingList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN ProductPacking.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN ProductPacking.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ProductPacking.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ProductPacking.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ProductPacking.[Active] END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ProductPacking.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		ProductPacking.Id,ProductPacking.Title, ProductPacking.OrderNumber,ProductPacking.Active
		FROM ProductPacking
		WHERE CustomerId = @CustomerId
		And ProductPacking.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR ProductPacking.[Title] like '%'+ @Search + '%'
				OR ProductPacking.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO