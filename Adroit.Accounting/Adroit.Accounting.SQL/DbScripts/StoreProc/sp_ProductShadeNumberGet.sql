CREATE OR ALTER PROCEDURE [dbo].[sp_ProductShadeNumberGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductShadeNumber
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO