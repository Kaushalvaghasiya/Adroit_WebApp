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
	FROM  Country
	INNER JOIN State ON State.CountryId = Country.Id 
	INNER JOIN District ON District.StateId = State.Id 
	INNER JOIN Taluka ON Taluka.DistrictId = District.Id 
	INNER JOIN City ON City.TalukaId = Taluka.Id 
	INNER JOIN CustomerFirmBranch  ON CustomerFirmBranch.CityId = City.Id 
	WHERE FirmId IN (SELECT Id FROM [CustomerFirm] WHERE [CustomerId] = @CustomerId) AND CustomerFirmBranch.Id = @Id
END
GO