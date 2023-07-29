CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerListBySoftwarePlan_Select]
(
	@Id TINYINT
)
AS
BEGIN
	SELECT DISTINCT
		Customer.Id As Value, Customer.[Name] + ' (' + Customer.BusinessName + ')' As Text
	FROM Software 
	INNER JOIN CustomerFirm ON CustomerFirm.SoftwareId = Software.Id
	INNER JOIN Customer ON CustomerFirm.CustomerId = Customer.Id
	WHERE Software.Id = @Id
	AND Customer.IsDeleted = 0
	AND CustomerFirm.IsDeleted = 0
	AND Software.IsDeleted = 0
	ORDER BY Customer.[Name] + ' (' + Customer.BusinessName + ')', Customer.Id
END
GO