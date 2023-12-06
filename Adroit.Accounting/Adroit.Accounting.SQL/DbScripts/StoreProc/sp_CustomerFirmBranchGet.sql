CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);
	
	SELECT 
		CustomerFirmBranch.*, 
		Taluka.Id As TalukaId,
		District.Id As DistrictId,
		FORMAT(CustomerFirmBranch.RenewalDate,'dd/MM/yyyy') AS RenewalDateString
	FROM  [CustomerFirm]
	INNER JOIN CustomerFirmBranch ON CustomerFirmBranch.FirmId = [CustomerFirm]. Id
	LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId
	LEFT JOIN Taluka ON Taluka.Id = City.TalukaId 
	LEFT JOIN District ON District.Id = Taluka.DistrictId 
	LEFT JOIN State ON State.Id = District.StateId 
	LEFT JOIN Country ON Country.Id = State.CountryId 
	WHERE [CustomerFirm].[CustomerId] = @CustomerId AND CustomerFirmBranch.Id = @Id
END
GO