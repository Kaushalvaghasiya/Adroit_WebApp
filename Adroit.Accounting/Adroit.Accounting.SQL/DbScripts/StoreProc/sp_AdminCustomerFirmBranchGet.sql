CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmBranchGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		CustomerFirmBranch.*, 
		City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		Taluka.Id As TalukaId,
		District.Id As DistrictId
	FROM CustomerFirmBranch 
	LEFT JOIN [City] on [CustomerFirmBranch].CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE CustomerFirmBranch.Id = @Id
END
GO