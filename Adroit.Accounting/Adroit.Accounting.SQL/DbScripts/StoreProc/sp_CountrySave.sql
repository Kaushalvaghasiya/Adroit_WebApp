--EXEC [dbo].[sp_CountrySave] '0','bac','+98','1'
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
		ELSE If EXISTS (SELECT 1 FROM Country WHERE Title = @Title AND PhoneCode = @PhoneCode AND Active = 0)
			BEGIN
				UPDATE  Country SET
						Title = @Title,
						PhoneCode = @PhoneCode,
						Active = @active
					WHERE PhoneCode = @PhoneCode AND Title = @Title 

				SELECT @Id=Id FROM Country WHERE PhoneCode = @PhoneCode AND Title = @Title 
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