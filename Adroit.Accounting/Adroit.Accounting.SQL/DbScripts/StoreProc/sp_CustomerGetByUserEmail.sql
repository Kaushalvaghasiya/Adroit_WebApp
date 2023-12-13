CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerGetByUserEmail]
(
	@Email varchar(50)
)
AS
BEGIN
	SELECT Customer.*,
		[Country].Id as CountryId, 
		[Country].Title as Country, 
		[State].Title as State, 
		[District].Id as DistrictId, 
		[District].Title as District, 
		[Taluka].Id as TalukaId, 
		[Taluka].Title as Taluka, 
		[City].Title as City
	FROM Customer
	INNER JOIN CustomerUser ON Customer.Id = CustomerUser.CustomerId
	INNER JOIN AspNetUsers ON CustomerUser.UserId = AspNetUsers.Id
	LEFT JOIN [City] on Customer.CityId = [City].Id
	LEFT JOIN [Taluka] on [City].TalukaId = [Taluka].Id
	LEFT JOIN [District] on [Taluka].DistrictId = [District].Id
	LEFT JOIN [State] on [District].StateId = [State].Id
	LEFT JOIN [Country] on [State].CountryId = [Country].Id
	WHERE AspNetUsers.UserName = @Email
END
GO