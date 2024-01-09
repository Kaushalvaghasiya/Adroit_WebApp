CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerBranchToBranchMappingList_Select]
AS
BEGIN
	SELECT 
		CustomerFirmBranch.Id As Value, 
		Customer.Name + ' | ' + CustomerFirm.Title + ' | ' + CustomerFirmBranch.Title As Text
	From Customer
	INNER JOIN CustomerFirm on Customer.Id = CustomerFirm.CustomerId
	INNER JOIN CustomerFirmBranch on CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE
	Customer.Deleted = 0 AND Customer.Active = 1
	AND CustomerFirm.Deleted = 0 AND CustomerFirm.Active = 1
	AND CustomerFirmBranch.Deleted = 0 AND CustomerFirmBranch.Active = 1
	ORDER BY Customer.Name, CustomerFirm.Title, CustomerFirmBranch.Title
END
GO