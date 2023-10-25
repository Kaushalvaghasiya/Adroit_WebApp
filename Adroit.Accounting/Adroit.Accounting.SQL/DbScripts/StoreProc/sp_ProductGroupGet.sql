CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGroupGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductGroup
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO