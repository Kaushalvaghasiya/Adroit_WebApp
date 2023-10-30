CREATE OR ALTER PROCEDURE [dbo].[sp_ProductFabricGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductFabric
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO