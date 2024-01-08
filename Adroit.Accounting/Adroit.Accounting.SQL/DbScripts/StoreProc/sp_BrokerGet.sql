CREATE OR ALTER PROCEDURE [dbo].[sp_BrokerGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT 
		[Broker].*,
		City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerBrokerBranchMapping t1
					WHERE t1.BrokerId = t.BrokerId and  Deleted = 0 FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerBrokerBranchMapping t
			WHERE t.BrokerId = @Id and  Deleted = 0 GROUP BY t.BrokerId) AS CustomerBrokerBranchIds,
		[Country].Id as CountryId, 
		[Country].Title as Country, 
		[State].Id as StateId, 
		[District].Id as DistrictId, 
		[Taluka].Id as TalukaId 
	FROM [Broker]
	LEFT JOIN [City] on [Broker].CityId = [City].Id AND City.Active = 1
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id AND Taluka.Active = 1
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id AND District.Active = 1
	LEFT JOIN [State] on [District].StateId = [State].Id AND State.Active = 1
	LEFT JOIN [Country] on [State].CountryId = [Country].Id AND Country.Active = 1
	WHERE [Broker].Id = @Id And CustomerId = @CustomerId
END
GO



