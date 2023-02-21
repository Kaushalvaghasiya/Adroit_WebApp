/****** Object:  StoredProcedure [dbo].[sp_CustomerDelete]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_CustomerDelete]
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