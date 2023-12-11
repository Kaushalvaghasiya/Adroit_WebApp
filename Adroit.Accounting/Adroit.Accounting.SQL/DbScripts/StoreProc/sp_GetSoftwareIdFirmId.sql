CREATE OR ALTER PROCEDURE [dbo].[sp_GetSoftwareIdFirmId] (
	@FirmId int
)
AS
BEGIN

    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT TOP 1 Software.Id
	FROM Software
	INNER JOIN BusinessSoftwareMapping on Software.Id = BusinessSoftwareMapping.SoftwareId
	INNER JOIN CustomerFirm on CustomerFirm.BusinessId = BusinessSoftwareMapping.BusinessId
	WHERE CustomerFirm.CustomerId = @CustomerId

END
GO