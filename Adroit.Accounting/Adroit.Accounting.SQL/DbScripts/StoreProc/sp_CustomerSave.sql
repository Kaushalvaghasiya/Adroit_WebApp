CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerSave]
(
	 @Id int,
	 @Name varchar(50),
	 @BusinessName varchar(250),
	 @Address1 varchar(200),
	 @Address2 varchar(200),
	 @Address3 varchar(200),
	 @CityId int,
	 @PinCode VARCHAR(10),
	 @ContactPersonName varchar(100),
	 @Mobile varchar(15),
	 @MobileAlternate varchar(15),
	 @Phone varchar(20),
	 @Email varchar(50),
	 @BusinessId smallint,
	 @Requirement nvarchar(max),
	 @TotalFirm smallint,
	 @CustomerType varchar(1),
	 @AdharUID varchar(12),
	 @TotalUsers smallint,
	 @Active bit,
	 @EmailOtp varchar(6),
	 @MobileOtp varchar(6),
	 @StatusId varchar(1),
	 @AgreeTerms bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		DECLARE @TalukaId INT
		SELECT @TalukaId = City.TalukaId from City WHERE City.Id = @CityId;

		DECLARE @DistrictId INT
		SELECT @DistrictId = Taluka.DistrictId from Taluka WHERE Taluka.Id = @TalukaId;

		DECLARE @StateId INT
		SELECT @StateId = District.StateId from District WHERE District.Id = @DistrictId;
		IF EXISTS (SELECT 1 FROM Customer WHERE Id = @Id)
			BEGIN
				UPDATE Customer SET
					[Name] = @Name,
					Address1 = @Address1,
					Address2 = @Address2,
					Address3 = @Address3,
					CityId = @CityId,
					StateId = @StateId,
					Pincode = @Pincode,
					ContactPersonName = @ContactPersonName,
					Mobile = @Mobile,
					MobileAlternate = @MobileAlternate,
					Phone = @Phone,
					Email = @Email,
					BusinessId = @BusinessId,
					Requirement = @Requirement,
					TotalFirm = @TotalFirm,
					CustomerType = @CustomerType,
					AdharUID = @AdharUID,
					TotalUsers = @TotalUsers,
					Active = @Active,
					EmailOtp = @EmailOtp,
					MobileOtp = @MobileOtp,
					StatusId = @StatusId,
					BusinessName = @BusinessName,
					AgreeTerms = @AgreeTerms
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				RAISERROR ('%s', 16, 1, 'Customer not found!');
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO