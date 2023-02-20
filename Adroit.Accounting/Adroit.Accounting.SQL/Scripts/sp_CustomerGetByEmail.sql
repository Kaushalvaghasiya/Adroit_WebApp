/****** Object:  StoredProcedure [dbo].[sp_CustomerGetByEmail]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CustomerGetByEmail]
(
	@Email varchar(50)
)
AS
BEGIN
	SELECT *
	FROM Customer WHERE Email = @Email
END
GO