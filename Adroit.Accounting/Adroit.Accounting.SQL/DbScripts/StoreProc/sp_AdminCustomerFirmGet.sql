CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmGet]
(
	@Id INT
)
AS
BEGIN
	SELECT CustomerFirm.*,Customer.[Name] as CustomerName
	FROM CustomerFirm 
	 LEFT JOIN Customer ON CustomerFirm.CustomerId=Customer.id
	WHERE CustomerFirm.Id = @Id
END
GO