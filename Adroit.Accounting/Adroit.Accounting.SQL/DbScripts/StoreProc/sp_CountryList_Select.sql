CREATE OR ALTER PROCEDURE [dbo].[sp_CountryList_Select]
AS
BEGIN
	SELECT Id As Value,Title As Text,PhoneCode As Other
	FROM [Country]
	WHERE Active = 1
END
GO