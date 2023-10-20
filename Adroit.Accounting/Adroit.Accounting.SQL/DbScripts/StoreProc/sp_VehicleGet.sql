CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT
		Vehilcle.*,
		[Country].Id as CountryId
		--[Country].Title as Country, 
		--[State].Title as State, 
		--[District].Id as DistrictId, 
		--[District].Title as District, 
		--[Taluka].Id as TalukaId, 
		--[Taluka].Title as Taluka, 
		--[City].Title as City
	FROM Vehilcle
	--LEFT JOIN [City] on VehicleOwner.CityId = [City].Id
	--LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	--LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on Vehilcle.StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE Vehilcle.Id = @Id And Vehilcle.CustomerId = @CustomerId
END
GO