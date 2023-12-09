CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN
	
	Declare @FirmId int = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId) 
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

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