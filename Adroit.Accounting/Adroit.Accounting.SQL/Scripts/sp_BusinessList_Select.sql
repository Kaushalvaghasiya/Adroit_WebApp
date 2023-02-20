/****** Object:  StoredProcedure [dbo].[sp_BusinessList_Select]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BusinessList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM Business
	ORDER BY OrderNumber
END
GO