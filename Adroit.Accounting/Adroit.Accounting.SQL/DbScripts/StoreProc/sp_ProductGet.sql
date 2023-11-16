CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGet]
(
	@LoginId INT
	,@Id INT
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	
	SELECT 
		Product.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM ProductBranchMapping t1
						WHERE t1.ProductId = t.ProductId FOR XML PATH('')),1,1,'') Concats
			FROM ProductBranchMapping t
			WHERE t.ProductId = @Id GROUP BY t.ProductId) AS ProductBranchId
	FROM Product
	WHERE Product.CustomerId = @CustomerId AND Product.Id = @Id


END
GO
