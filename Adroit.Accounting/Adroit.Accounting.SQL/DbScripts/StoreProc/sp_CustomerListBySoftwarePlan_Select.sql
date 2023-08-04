CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerListBySoftwarePlan_Select]
(
	@Id TINYINT
)
AS
BEGIN
	SELECT DISTINCT
		Customer.Id As Value, Customer.[Name] + ' (' + Customer.BusinessName + ')' As Text
	FROM Software 
	INNER JOIN SoftwarePlan ON Software.Id = SoftwarePlan.SoftwareId
	INNER JOIN CustomerFirm ON CustomerFirm.SoftwareId = Software.Id
	INNER JOIN CustomerFirmBranch ON CustomerFirm.Id = CustomerFirmBranch.FirmId
	INNER JOIN Customer ON CustomerFirm.CustomerId = Customer.Id
	WHERE CustomerFirmBranch.SoftwarePlanId = @Id 
	AND Customer.IsDeleted = 0
	AND CustomerFirm.IsDeleted = 0
	AND Software.IsDeleted = 0
	ORDER BY Customer.[Name] + ' (' + Customer.BusinessName + ')', Customer.Id
END
GO