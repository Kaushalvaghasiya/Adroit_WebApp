CREATE OR ALTER PROCEDURE [dbo].[sp_ProductColorGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductColor
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO