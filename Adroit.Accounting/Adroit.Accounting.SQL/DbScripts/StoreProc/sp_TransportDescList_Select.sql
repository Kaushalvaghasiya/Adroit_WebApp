CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescList_Select] 
(
	@FirmId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT Title As [Text]
	FROM [TransportDesc]
	WHERE Deleted = 0 AND Active = 1
	AND CustomerId = @CustomerId

	UNION 

	SELECT Title As [Text]
	FROM [TransportDescAdmin]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title

END


