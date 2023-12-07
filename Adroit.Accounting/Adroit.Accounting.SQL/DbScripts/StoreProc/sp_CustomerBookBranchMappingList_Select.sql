CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookBranchMappingList_Select]
(
	 @FirmId int,
	 @BranchId int
)
AS
BEGIN
		Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);
		
		SELECT CustomerBookBranchMapping.Id As Value, CustomerAccount.[Name] As Text
		FROM CustomerBookBranchMapping 
		INNER JOIN [CustomerBook] ON CustomerBookBranchMapping.BookId = [CustomerBook].Id AND CustomerBookBranchMapping.BranchId = @BranchId  
		INNER JOIN CustomerAccount on CustomerBook.BookAccountId = [CustomerAccount].Id AND CustomerAccount.CustomerId = @CustomerId
		WHERE CustomerBookBranchMapping.Deleted = 0
		AND [CustomerBook].Deleted = 0
		AND [CustomerBook].Active = 1
		AND [CustomerBook].CustomerId = @CustomerId
		ORDER BY CustomerAccount.[Name] 

END
GO