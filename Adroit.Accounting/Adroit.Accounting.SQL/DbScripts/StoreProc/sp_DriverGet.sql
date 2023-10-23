CREATE OR ALTER PROCEDURE [dbo].[sp_DriverGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT 
		Driver.*,
		[Country].Id as CountryId, 
		[Country].Title as Country, 
		[State].Title as State, 
		[District].Id as DistrictId, 
		[District].Title as District, 
		[Taluka].Id as TalukaId, 
		[Taluka].Title as Taluka, 
		[City].Title as City
	FROM Driver
	LEFT JOIN [City] on Driver.CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE Driver.Id = @Id And CustomerId = @CustomerId
END


GO



