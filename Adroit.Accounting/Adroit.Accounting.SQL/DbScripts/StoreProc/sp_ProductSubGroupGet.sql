CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSubGroupGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductSubGroup
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO