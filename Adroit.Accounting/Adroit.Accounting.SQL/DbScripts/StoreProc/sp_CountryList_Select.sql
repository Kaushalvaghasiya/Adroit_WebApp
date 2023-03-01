CREATE OR ALTER PROCEDURE [dbo].[sp_CountryList_Select]
AS
BEGIN
	SELECT Id,Title,PhoneCode
	FROM [Country]
END
GO