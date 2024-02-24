CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookBranchMappingListByBookType_Select]
(
	 @BranchId int,
	 @BookType VARCHAR(MAX)
)
AS
BEGIN
		Declare @FirmId int = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId) 
		Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

		SELECT CustomerBookBranchMapping.Id As Value, CustomerAccount.[Name] As Text
		FROM CustomerBookBranchMapping 
		INNER JOIN [CustomerBook] ON CustomerBookBranchMapping.BookId = [CustomerBook].Id AND CustomerBookBranchMapping.BranchId = @BranchId  
		INNER JOIN CustomerAccount on CustomerBook.BookAccountId = [CustomerAccount].Id AND CustomerAccount.CustomerId = @CustomerId
		INNER JOIN BookTypeAdmin ON CONCAT(',', CAST(BookTypeAdmin.Id AS VARCHAR), ',') LIKE CONCAT('%,', CustomerBook.BookTypeId, ',%')
		WHERE [CustomerBook].CustomerId = @CustomerId AND BookTypeAdmin.Title = @BookType
		AND [CustomerBook].Deleted = 0
		AND [CustomerBook].Active = 1
		AND CustomerBookBranchMapping.Deleted = 0
		ORDER BY CustomerAccount.[Name] 

END
GO