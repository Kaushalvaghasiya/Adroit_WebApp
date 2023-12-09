CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerFirm.*,Customer.[Name] as CustomerName
	FROM CustomerFirm 
	 LEFT JOIN Customer ON CustomerFirm.CustomerId=Customer.id
	WHERE CustomerFirm.CustomerId = @CustomerId AND CustomerFirm.Id = @Id 
END
GO