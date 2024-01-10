CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveAgencyGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN
	
	SELECT [Z-ChalanReceiveAgencyMaster-Z].*
	FROM [Z-ChalanReceiveAgencyMaster-Z]
	WHERE Id = @Id

END
GO