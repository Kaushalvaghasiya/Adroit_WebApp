CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupHeaderGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT *
	FROM CustomerAccountGroupHeader WHERE Id = @Id And CustomerId = @CustomerId
END
GO