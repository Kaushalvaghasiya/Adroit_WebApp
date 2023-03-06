CREATE OR ALTER   procedure [dbo].[sp_BookAdminDelete]
(
	@LoginId int
	,@FirmId int
	,@Id INT
)
AS
BEGIN
	UPDATE BookAdmin 
	SET IsDeleted = 1, IsActive = 0
	WHERE Id= @Id;
END
GO