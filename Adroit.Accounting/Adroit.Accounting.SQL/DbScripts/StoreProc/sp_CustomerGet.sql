/****** Object:  StoredProcedure [dbo].[sp_CustomerGet]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CustomerGet]
(
	@ID INT
)
AS
BEGIN
	SELECT *
	FROM Customer WHERE Id = @ID
END
GO