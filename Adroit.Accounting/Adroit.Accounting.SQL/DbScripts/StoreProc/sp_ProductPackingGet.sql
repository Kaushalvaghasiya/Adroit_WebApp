CREATE OR ALTER PROCEDURE [dbo].[sp_ProductPackingGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductPacking
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO