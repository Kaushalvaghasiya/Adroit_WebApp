CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductSize
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO