CREATE OR ALTER Procedure [dbo].[sp_BrokerList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@LoginId);

	SELECT * FROM
	(   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Name] END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ContactPersonName END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ContactPersonName END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN City.Title END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN City.Title END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Broker].Active END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Broker].Active END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		Broker.*,
		City.Title As City
		FROM [Broker]
		LEFT JOIN City on City.Id = [Broker].CityId
		WHERE [Broker].Deleted = 0 And [Broker].CustomerId=@CustomerId
		AND (
			Coalesce(@Search,'') = '' OR [Broker].[Name] like '%'+ @Search + '%'
			OR ContactPersonName like '%'+ @Search + '%'
			OR City.Title like '%'+ @Search + '%'
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO


