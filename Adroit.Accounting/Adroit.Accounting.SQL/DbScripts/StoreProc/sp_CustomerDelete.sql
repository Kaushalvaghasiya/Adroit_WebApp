CREATE OR ALTER procedure [dbo].[sp_CustomerDelete]
(
	@Id INT
)
AS
BEGIN
	UPDATE Customer SET 
		IsDeleted = 1
	WHERE Id= @Id ;
END
GO