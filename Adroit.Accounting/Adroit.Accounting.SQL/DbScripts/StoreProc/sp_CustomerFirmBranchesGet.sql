CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchesGet]
(
	@Id INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	
	SELECT 
		CustomerFirmBranch.*, 
		Taluka.Id As TalukaId,
		District.Id As DistrictId
	FROM CustomerFirmBranch 
	LEFT JOIN City ON CustomerFirmBranch.CityId = City.Id
	LEFT JOIN Taluka ON City.TalukaId = Taluka.Id
	LEFT JOIN District ON Taluka.DistrictId = District.Id
	LEFT JOIN State ON District.StateId = State.Id
	LEFT JOIN Country ON State.CountryId = Country.Id
	WHERE FirmId IN (SELECT Id FROM [CustomerFirm] WHERE [CustomerId] = @CustomerId) AND CustomerFirmBranch.Id = @Id
END
GO