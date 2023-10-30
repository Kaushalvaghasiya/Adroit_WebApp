CREATE OR ALTER Procedure [dbo].[sp_ProductDesignNumberList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN ProductDesignNumber.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN ProductDesignNumber.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ProductDesignNumber.[OrderNumber] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ProductDesignNumber.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ProductDesignNumber.[Active] END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ProductDesignNumber.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		ProductDesignNumber.Id,ProductDesignNumber.Title, ProductDesignNumber.OrderNumber,ProductDesignNumber.Active
		FROM ProductDesignNumber
		WHERE CustomerId = @CustomerId
		And ProductDesignNumber.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
				OR ProductDesignNumber.[Title] like '%'+ @Search + '%'
				OR ProductDesignNumber.[Title] like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO