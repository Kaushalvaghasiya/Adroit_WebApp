CREATE OR ALTER Procedure [dbo].[sp_ProductList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Product].Code END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Product].Code END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Product].Title END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Product].Title END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [ProductDesignNumber].Title END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [ProductDesignNumber].Title END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [ProductColor].Title END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [ProductColor].Title END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [GSTUQC].Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [GSTUQC].Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [GSTCalculation].Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [GSTCalculation].Title END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		Product.*,[ProductDesignNumber].Title as ProductDesignNumber
		,[ProductColor].Title as ColorName
		,[GSTUQC].Title as UQCTypeName
		,[GSTCalculation].Title as GSTCalculationName
		FROM Product
		LEFT JOIN [ProductDesignNumber] on Product.DesignNumberId = [ProductDesignNumber].Id
		LEFT JOIN [ProductColor] on Product.ColourId = [ProductColor].Id
		INNER JOIN [GSTUQC] on Product.UQCId = [GSTUQC].Id
		INNER JOIN [GSTCalculation] on Product.GSTCalculationId = [GSTCalculation].Id
		WHERE [Product].Deleted = 0
		AND (Coalesce(@Search,'') = '' OR [Product].Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
