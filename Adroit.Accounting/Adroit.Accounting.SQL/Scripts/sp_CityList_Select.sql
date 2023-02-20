/****** Object:  StoredProcedure [dbo].[sp_CityList_Select]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CityList_Select]
 @StateId int = 0,
 @TalukaId int = 0,
 @DistrictId int = 0
AS
BEGIN
	IF @StateId > 0
	BEGIN
		SELECT City.Id,City.Title
		FROM City
		JOIN Taluka on City.TalukaId = Taluka.Id
		JOIN District on Taluka.DistrictId = District.Id
		WHERE District.StateId = @StateId
	END
	ELSE IF @DistrictId > 0
	BEGIN
		SELECT City.Id,City.Title
		FROM City
		JOIN Taluka on City.TalukaId = Taluka.Id
		WHERE Taluka.DistrictId = @DistrictId
	END
	ELSE IF @TalukaId > 0
	BEGIN
		SELECT City.Id,City.Title
		FROM City
		WHERE City.TalukaId = @TalukaId
	END
	ELSE
	BEGIN
		SELECT Id,Title
		FROM City
	END
END
GO