CREATE OR ALTER PROCEDURE [dbo].[sp_GetListWithIsGeneralPurchaseId]
(
	@loginId INT,
	@branchId INT,
	@firmId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@loginId);

	SELECT TOP 1 CustomerBookBranchMapping.Id As CustomerBookBranchMappingId,[CustomerBook].*
	FROM CustomerBookBranchMapping 
		INNER JOIN [CustomerBook] ON CustomerBookBranchMapping.BookId = [CustomerBook].Id
		INNER JOIN CustomerAccount on CustomerBook.BookAccountId = [CustomerAccount].Id
	WHERE CustomerBookBranchMapping.Deleted = 0
		AND [CustomerBook].Deleted = 0
		AND [CustomerBook].Active = 1
		AND [CustomerBook].CustomerId = @CustomerId
		AND [CustomerBook].IsGeneralPurchase = 1

END


GO


