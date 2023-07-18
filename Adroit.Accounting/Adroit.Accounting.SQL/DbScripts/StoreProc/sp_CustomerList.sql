CREATE OR ALTER Procedure [dbo].[sp_CustomerList]
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
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Customer.[Name] END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Customer.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN dbo.[fn_GetCustomerType](Customer.CustomerType) END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN dbo.[fn_GetCustomerType](Customer.CustomerType) END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [City].Title END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [City].Title END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN dbo.[fn_GetCustomerStatus](Customer.StatusId) END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN dbo.[fn_GetCustomerStatus](Customer.StatusId) END DESC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN Customer.Mobile END ASC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN Customer.Mobile END DESC,
		 CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN (SELECT COUNT(*) FROM CustomerFirm WHERE CustomerFirm.CustomerId = Customer.Id AND IsDeleted = 0) END ASC,
		 CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN (SELECT COUNT(*) FROM CustomerFirm WHERE CustomerFirm.CustomerId = Customer.Id AND IsDeleted = 0) END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   Customer.*, 
	   [Country].Id as CountryId, 
	   [Country].Title as Country, 
	   [State].Title as State, 
	   [District].Id as DistrictId, 
	   [District].Title as District, 
	   [Taluka].Id as TalukaId, 
	   [Taluka].Title as Taluka, 
	   [City].Title as City,
	   (SELECT COUNT(*) FROM CustomerFirm WHERE CustomerFirm.CustomerId = Customer.Id AND IsDeleted = 0) AS NumberOfFirmsCreated
	  FROM Customer
	  LEFT JOIN [City] on Customer.CityId = [City].Id
	  LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	  LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	  LEFT JOIN [State] on [District].StateId = [State].Id
	  LEFT JOIN [Country] on [State].CountryId = [Country].Id
	  WHERE Customer.IsDeleted = 0
	  AND (Coalesce(@Search,'') = '' OR Customer.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO