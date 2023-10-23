CREATE OR ALTER PROCEDURE [dbo].[sp_LicenceIssuePlaceList_Select]
(
	@Id TINYINT
)
AS
BEGIN
	Select City.Id As Value,
	City.Title + ',' + Taluka.Title + ',' + District.Title + ',' + State.Title + ',' + Country.Title  As Text
	From City City
	Left Join Taluka On City.TalukaId =  Taluka.Id
	Left Join District On Taluka.DistrictId = District.Id 
	Left Join State On District.StateId = State.Id 
	Left Join Country On State.CountryId = Country.Id 
	Where City.Active = 1
END
GO
