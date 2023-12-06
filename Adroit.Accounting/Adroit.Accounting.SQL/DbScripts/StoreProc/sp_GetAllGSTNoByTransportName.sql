CREATE OR ALTER PROCEDURE [dbo].[sp_GetAllGSTNoByTransportName]
(
	@SearchName VARCHAR(50),
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT DISTINCT GSTNumberTransport
	FROM CustomerAccount	
	WHERE UPPER(TransportName) = UPPER(@SearchName) AND CustomerAccount.CustomerId = @CustomerId
END
GO