CREATE OR ALTER PROCEDURE [dbo].[sp_GetSoftwareIdByUserIdThroughBusinessId] (
	@loginId int
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerId(@loginId);

	SELECT TOP 1 Software.Id
	FROM Software
	INNER JOIN BusinessSoftwareMapping on Software.Id = BusinessSoftwareMapping.SoftwareId
	INNER JOIN CustomerFirm on CustomerFirm.BusinessId = BusinessSoftwareMapping.BusinessId
	WHERE CustomerFirm.CustomerId = @CustomerId

END
GO