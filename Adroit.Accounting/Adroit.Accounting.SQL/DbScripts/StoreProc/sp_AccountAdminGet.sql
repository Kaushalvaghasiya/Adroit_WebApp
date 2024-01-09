CREATE OR ALTER PROCEDURE [dbo].[sp_AccountAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT AccountAdmin.*, 
	City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		Taluka.Id As TalukaId,
		District.Id As DistrictId
	FROM AccountAdmin
	LEFT JOIN [City] on [AccountAdmin].CityId = [City].Id AND City.Active = 1
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id AND Taluka.Active = 1
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id AND District.Active = 1
	LEFT JOIN [State] on [District].StateId = [State].Id AND State.Active = 1
	LEFT JOIN [Country] on [State].CountryId = [Country].Id AND Country.Active = 1
	WHERE AccountAdmin.Id = @Id
END
GO