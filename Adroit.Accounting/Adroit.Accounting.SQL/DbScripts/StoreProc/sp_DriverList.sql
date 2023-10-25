CREATE OR ALTER Procedure [dbo].[sp_DriverList]
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
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Driver.Active END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Driver.Active END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN dbo.[fn_GetUserBranches](Driver.Id) END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN dbo.[fn_GetUserBranches](Driver.Id) END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   Driver.*,
	   DriverTypeAdmin.Title As DriverType,
	   City.Title As City,
	   State.Title As State,
	   LicenceIssuePlace.Title As LicenceIssuePlace
	  FROM Driver
	  LEFT JOIN DriverTypeAdmin on DriverTypeAdmin.Id = Driver.DriverTypeId
	  LEFT JOIN City on City.Id = Driver.CityId
	  LEFT JOIN State on State.Id = Driver.StateId
	  LEFT JOIN City  LicenceIssuePlace on LicenceIssuePlace.Id = Driver.LicenceIssuePlaceId
	  WHERE Driver.Deleted = 0 and Driver.CustomerId=@CustomerId
	  AND (Coalesce(@Search,'') = '' OR Driver.[Name] like '%'+ @Search + '%' )
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End


GO


