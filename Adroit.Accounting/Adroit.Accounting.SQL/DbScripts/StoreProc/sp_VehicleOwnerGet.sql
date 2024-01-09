CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleOwnerGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT
		VehicleOwner.*,
		City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		[Country].Id as CountryId, 
		[Country].Title as Country, 
		[State].Title as State, 
		[District].Id as DistrictId, 
		[District].Title as District, 
		[Taluka].Id as TalukaId, 
		[Taluka].Title as Taluka		
	FROM VehicleOwner
	LEFT JOIN [City] on [VehicleOwner].CityId = [City].Id AND City.Active = 1
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id AND Taluka.Active = 1
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id AND District.Active = 1
	LEFT JOIN [State] on [District].StateId = [State].Id AND State.Active = 1
	LEFT JOIN [Country] on [State].CountryId = [Country].Id AND Country.Active = 1
	WHERE VehicleOwner.Id = @Id And VehicleOwner.CustomerId = @CustomerId
END
GO