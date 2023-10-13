CREATE OR ALTER PROCEDURE [dbo].[sp_CountrySave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @PhoneCode VARCHAR(5),
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Country WHERE Id = @Id)
			BEGIN
				UPDATE  Country SET
						Title = @Title,
						PhoneCode = @PhoneCode,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM Country WHERE Title = @Title)
			BEGIN
				declare @errorMessage VARCHAR(4000);
				SET @errorMessage = 'Country ''' + @Title + ''' already exist!';
				RAISERROR ('%s', 16, 1,@errorMessage);
			END
		ELSE
			BEGIN
				INSERT INTO Country
					(Title, PhoneCode, Active)
				VALUES
					(@Title, @PhoneCode, @Active)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		
		IF (@message LIKE '%IX_CountryMaster%')
			BEGIN
				SET @message = 'Country ''' + @Title + ''' already exist!';
			END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END