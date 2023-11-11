CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookBranchMappingList_Select]
(
	 @loginId int
)
AS
BEGIN
		DECLARE @CustomerId int = dbo.fn_GetCustomerId(@loginId);

		SELECT CustomerBookBranchMapping.Id As Value, CustomerAccount.[Name] As Text
		FROM CustomerBookBranchMapping 
		INNER JOIN [CustomerBook] ON CustomerBookBranchMapping.BookId = [CustomerBook].Id
		INNER JOIN CustomerAccount on CustomerBook.BookAccountId = [CustomerAccount].Id
		WHERE CustomerBookBranchMapping.Deleted = 0
		AND [CustomerBook].Deleted = 0
		AND [CustomerBook].Active = 1
		AND [CustomerBook].CustomerId = @CustomerId
		ORDER BY CustomerAccount.[Name] 
END
GO