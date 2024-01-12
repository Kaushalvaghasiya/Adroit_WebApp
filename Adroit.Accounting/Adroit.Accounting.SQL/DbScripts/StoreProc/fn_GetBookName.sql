CREATE OR ALTER FUNCTION [fn_GetBookName]
(
	@bookmappingId int
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @name varchar(100) = ''

	SELECT TOP 1 @name = CustomerAccount.Name
	FROM CustomerBookBranchMapping
	INNER JOIN CustomerBook ON CustomerBookBranchMapping.BookId = CustomerBook.Id
	INNER JOIN CustomerAccount ON CustomerBook.BookAccountId = CustomerAccount.Id
	WHERE CustomerBookBranchMapping.Id = @bookmappingId 

	RETURN SUBSTRING(@name, 0, LEN(@name))
END