CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerListBySoftware_Select]
(
	@Id TINYINT
)
AS
BEGIN
	SELECT DISTINCT
		Customer.Id As Value, Customer.[Name] + ' (' + Customer.BusinessName + ')' As Text
	FROM Customer
	INNER JOIN CustomerFirm ON Customer.Id = CustomerFirm.CustomerId
	INNER JOIN Software ON CustomerFirm.SoftwareId = Software.Id
	WHERE Software.Id = @Id
	AND Customer.Deleted = 0
	AND CustomerFirm.Deleted = 0
	AND Software.Deleted = 0
	ORDER BY Customer.[Name] + ' (' + Customer.BusinessName + ')', Customer.Id
END
GO