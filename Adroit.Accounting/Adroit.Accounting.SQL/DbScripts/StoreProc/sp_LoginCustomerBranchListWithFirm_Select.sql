CREATE OR ALTER PROCEDURE [dbo].[sp_LoginCustomerBranchListWithFirm_Select]
(
	@LoginId INT
)
AS
BEGIN

	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	SELECT CustomerFirmBranch.Id As Value 
	,CONCAT(
        ISNULL(CustomerFirm.Title, ''),
        NULLIF(' | ' + ISNULL(CustomerFirmBranch.Title, ''), ' | ')
    ) AS Text
	FROM CustomerFirm 
	INNER JOIN CustomerFirmBranch on CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE CustomerFirm.CustomerId = @CustomerId
	AND CustomerFirm.Deleted = 0 
	AND CustomerFirmBranch.Deleted = 0 AND CustomerFirmBranch.Active = 1
	ORDER BY CustomerFirm.Title,CustomerFirmBranch.Title

END
GO