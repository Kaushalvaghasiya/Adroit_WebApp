CREATE OR ALTER   PROCEDURE [dbo].[sp_GetCustomerBookWithBranchMapping]
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
						WHERE t1.BookId = t.BookId AND Deleted = 0 AND t1.BranchId = @BranchId FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerBookBranchMapping t
			WHERE t.Id = @Id AND Deleted = 0 AND t.BranchId = @BranchId GROUP BY t.BookId) AS CustomerBookBranchId
	FROM CustomerBook
	LEFT JOIN CustomerBookBranchMapping ON CustomerBookBranchMapping.BookId = CustomerBook.Id
	WHERE CustomerBook.CustomerId = @CustomerId AND CustomerBookBranchMapping.Id = @Id

END
GO