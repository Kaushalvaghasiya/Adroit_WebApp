CREATE OR ALTER PROCEDURE [dbo].[sp_AccountAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT AccountAdmin.*, 
		Taluka.Id As TalukaId,
		District.Id As DistrictId
	FROM AccountAdmin
	LEFT JOIN City ON AccountAdmin.CityId = City.Id
	LEFT JOIN Taluka ON City.TalukaId = Taluka.Id
	LEFT JOIN District ON Taluka.DistrictId = District.Id
	LEFT JOIN State ON District.StateId = State.Id
	LEFT JOIN Country ON State.CountryId = Country.Id
	WHERE AccountAdmin.Id = @Id
END
GO