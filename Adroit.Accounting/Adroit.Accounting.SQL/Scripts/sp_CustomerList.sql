/****** Object:  StoredProcedure [dbo].[sp_CustomerList]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Exec [sp_CustomerList] '',1,10,0,'asc'
CREATE Procedure [dbo].[sp_CustomerList]
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
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
	   CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Customer.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Customer.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Customer.Email END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Customer.Email END DESC  
		) AS RowNum,
	   Count(*) over () AS TotalRows, Customer.*, [State].Title as [State], [City].Title as [City]
	  FROM Customer
	  LEFT JOIN [State] on Customer.StateId = [State].Id
	  LEFT JOIN [City] on Customer.CityId = [City].Id
	  WHERE Customer.IsDeleted = 0
	  AND (Coalesce(@Search,'') = '' OR Customer.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO