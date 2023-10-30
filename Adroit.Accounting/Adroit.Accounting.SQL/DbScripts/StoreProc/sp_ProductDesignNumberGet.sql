CREATE OR ALTER PROCEDURE [dbo].[sp_ProductDesignNumberGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM ProductDesignNumber
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO