CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerGet]
(
	@Id INT
)
AS
BEGIN
	SELECT Customer.*,
		City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As City,
		[Country].Id as CountryId, 
		[Country].Title as Country, 
		[State].Title as State, 
		[District].Id as DistrictId, 
		[District].Title as District, 
		[Taluka].Id as TalukaId, 
		[Taluka].Title as Taluka
	FROM Customer
	LEFT JOIN [City] on Customer.CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE Customer.Id = @Id
END
GO