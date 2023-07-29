CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchWithFirmListByCustomer_Select]
(@CustomerId INT)
AS
BEGIN
	SELECT 
		CustomerFirmBranch.Id As Value, 
		CustomerFirmBranch.Title + ' (' + CustomerFirm.Title + ')' As Text
	FROM Customer
	INNER JOIN CustomerFirm on Customer.Id = CustomerFirm.CustomerId
	INNER JOIN CustomerFirmBranch on CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE Customer.id = @CustomerId
	AND Customer.IsDeleted = 0
	AND CustomerFirm.IsDeleted = 0
	AND CustomerFirmBranch.IsDeleted = 0
	ORDER BY CustomerFirm.Title, CustomerFirmBranch.Title
END
GO