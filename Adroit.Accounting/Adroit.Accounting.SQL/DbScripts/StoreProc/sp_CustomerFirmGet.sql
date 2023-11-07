CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmGet]
(
	@Id INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	SELECT CustomerFirm.*,Customer.[Name] as CustomerName
	FROM CustomerFirm 
	 LEFT JOIN Customer ON CustomerFirm.CustomerId=Customer.id
	WHERE CustomerFirm.CustomerId = @CustomerId AND CustomerFirm.Id = @Id 
END
GO