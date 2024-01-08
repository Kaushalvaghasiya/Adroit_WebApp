CREATE OR ALTER Procedure [dbo].[sp_VehicleOwnerList]
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
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN VehicleOwner.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN VehicleOwner.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN VehicleOwner.[Active] END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN VehicleOwner.[Active] END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, VehicleOwner.* ,
	   CustomerAccount.[Name] as AccountName,
	   [City].Title As CityName
	  FROM VehicleOwner
	  LEFT JOIN CustomerAccount ON VehicleOwner.AccountId = CustomerAccount.Id
	  LEFT JOIN [City] on VehicleOwner.CityId = [City].Id
	  WHERE VehicleOwner.Deleted = 0 And VehicleOwner.CustomerId = @CustomerId
	  AND (Coalesce(@Search,'') = '' OR VehicleOwner.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO