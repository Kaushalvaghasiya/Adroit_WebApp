CREATE OR ALTER procedure [dbo].[sp_CustomerDelete]
(
	@ID INT
)
AS
BEGIN
	UPDATE Customer 
	SET IsDeleted=1
	WHERE Id= @ID;
END
GO