CREATE OR ALTER FUNCTION [dbo].[fn_GetCustomerIdByFirmId]
(
	@FirmId int
)
RETURNS int
AS
BEGIN
	DECLARE @CustomerId int 
	SET @CustomerId = (SELECT TOP 1 CustomerId 
					   FROM CustomerFirm 
					   WHERE Id = @FirmId 
					   	     AND Deleted = 0 
					   	     AND Active = 1 )

	RETURN @CustomerId;
END
GO
