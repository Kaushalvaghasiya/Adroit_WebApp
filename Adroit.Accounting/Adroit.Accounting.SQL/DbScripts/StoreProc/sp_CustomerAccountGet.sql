CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGet]
(
	@LoginId int = 0,
	@FirmId int = 0,
	@Id INT
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerAccount.*,
	City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		   (SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerAccountBranchMapping t1
					WHERE t1.AccountId = t.AccountId AND Deleted = 0 FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerAccountBranchMapping t
			WHERE t.AccountId = @Id AND Deleted = 0 GROUP BY t.AccountId) AS CustomerAccountBranchIds,
		   Taluka.Id As TalukaId,
		   District.Id As DistrictId
	FROM CustomerAccount
	LEFT JOIN [City] on [CustomerAccount].CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE CustomerAccount.Id = @Id AND CustomerAccount.CustomerId = @CustomerId
END
GO