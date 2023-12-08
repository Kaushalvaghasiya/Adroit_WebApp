CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerBranchListWithFirm_Select]
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
	FROM CustomerFirmBranch
	INNER JOIN CustomerFirm on CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE CustomerFirm.Deleted = 0 AND CustomerFirm.CustomerId = @CustomerId
	AND CustomerFirmBranch.Deleted = 0 AND CustomerFirmBranch.Active = 1
	ORDER BY CustomerFirm.Title,CustomerFirmBranch.Title

END
GO