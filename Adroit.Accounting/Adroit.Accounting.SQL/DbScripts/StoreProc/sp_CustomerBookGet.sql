CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookGet]
(
	 @loginId INT
	,@firmId INT
	,@Id INT
)
AS
BEGIN
	
	Declare @CustomerId int = dbo.fn_GetCustomerId(@loginId);
	
	SELECT 
		CustomerBook.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerBookBranchMapping t1
						WHERE t1.BookId = t.BookId FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerBookBranchMapping t
			WHERE t.BookId = @Id GROUP BY t.BookId) AS CustomerBookBranchId
	FROM CustomerBook
	WHERE CustomerBook.CustomerId = @CustomerId AND CustomerBook.Id = @Id

END
GO