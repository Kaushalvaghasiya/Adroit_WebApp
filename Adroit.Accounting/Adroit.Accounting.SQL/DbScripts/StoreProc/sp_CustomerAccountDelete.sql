CREATE OR ALTER procedure [dbo].[sp_CustomerAccountDelete]
(
	@LoginId int
	,@FirmId int
	,@Id INT
)
AS
BEGIN
	UPDATE CustomerAccount 
	SET IsDeleted = 1, IsActive = 0
	WHERE Id= @Id;
END
GO