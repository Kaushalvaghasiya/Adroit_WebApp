CREATE OR ALTER Procedure [dbo].[sp_VehicleList]
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
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Vehilcle.VRN END ASC,  
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Vehilcle.VRN END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN VehicleModel.[Title] END ASC,  
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN VehicleModel.[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN VehicleOwner.[Name] END ASC,  
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN VehicleOwner.[Name] END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN Vehilcle.ChasisNumber END ASC,  
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN Vehilcle.ChasisNumber END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN Vehilcle.[Active] END ASC,  
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN Vehilcle.[Active] END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, Vehilcle.* ,
			VehicleModel.Title AS ModelName,
			VehicleOwner.[Name] As OwnerName
		FROM Vehilcle
		LEFT JOIN VehicleModel on VehicleModel.Id = Vehilcle.ModelId
		LEFT JOIN VehicleOwner on VehicleOwner.Id = Vehilcle.OwnerId
		WHERE Vehilcle.Deleted = 0 And Vehilcle.CustomerId = @CustomerId
		AND (Coalesce(@Search,'') = '' 
				OR Vehilcle.[VRN] like '%'+ @Search + '%'
				OR VehicleModel.[Title] like '%'+ @Search + '%'
				OR VehicleOwner.[Name] like '%'+ @Search + '%'
				OR Vehilcle.ChasisNumber like '%'+ @Search + '%'
			)
	) AS T   
	WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO