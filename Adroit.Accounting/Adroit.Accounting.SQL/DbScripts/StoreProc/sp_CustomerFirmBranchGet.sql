CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT 
		CustomerFirmBranch.*, 
		City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		Taluka.Id As TalukaId,
		District.Id As DistrictId,
		FORMAT(CustomerFirmBranch.RenewalDate,'dd/MM/yyyy') AS RenewalDateString
	FROM  [CustomerFirm]
	INNER JOIN CustomerFirmBranch ON CustomerFirmBranch.FirmId = [CustomerFirm]. Id
	LEFT JOIN [City] on [CustomerFirmBranch].CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE [CustomerFirm].[CustomerId] = @CustomerId AND CustomerFirmBranch.Id = @Id
END
GO