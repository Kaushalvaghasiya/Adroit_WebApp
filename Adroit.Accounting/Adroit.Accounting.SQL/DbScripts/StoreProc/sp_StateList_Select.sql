/****** Object:  StoredProcedure [dbo].[sp_StateList_Select]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_StateList_Select]
	@CountryId int = 0
AS
BEGIN
	IF @CountryId > 0
	BEGIN
		SELECT Id,Title
		FROM [State]
		WHERE CountryId = @CountryId
	END
	ELSE
	BEGIN
		SELECT Id,Title
		FROM [State]
	END	
END
GO
