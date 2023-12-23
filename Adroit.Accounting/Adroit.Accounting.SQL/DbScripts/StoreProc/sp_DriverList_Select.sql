CREATE OR ALTER PROCEDURE [dbo].[sp_DriverList_Select]
(
	@LoginId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@loginId);

	SELECT Driver.Id As Value, 
	CONCAT(
        ISNULL(Driver.Name, ''),
        NULLIF(' | ' + ISNULL(City.Title, ''), ' | '),
        NULLIF(' | ' + ISNULL(Driver.Mobile, ''), ' | ') 
    ) AS Text
	FROM Driver
	LEFT JOIN City on City.Id = Driver.CityId AND City.Active = 1
	WHERE Driver.CustomerId = @CustomerId 
	AND Driver.Deleted = 0 
	AND Driver.Active = 1 
	ORDER BY [Text];
END


GO


