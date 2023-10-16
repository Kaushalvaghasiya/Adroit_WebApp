CREATE OR ALTER PROCEDURE [dbo].[sp_StateSave]
(
	 @Id INT,
	 @Title VARCHAR(100),
	 @TitleGSTR VARCHAR(100),
	 @TitleEWay VARCHAR(100),
	 @Code	VARCHAR(5),
	 @CountryId INT,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM State WHERE Id = @Id)
			BEGIN
				UPDATE  [State] SET
						Title = @Title,
						TitleGSTR = @TitleGSTR,
						TitleEWay = @TitleEWay,
						CountryId=@CountryId,
						Code=@Code,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM [State] WHERE Title = @Title AND CountryId=@CountryId)
			BEGIN
				declare @errorMessage  VARCHAR(4000);
				SET @errorMessage = 'State ''' + @Title + ''' already exist!';
				RAISERROR ('%s', 16, 1,@errorMessage);
			END
		ELSE
			BEGIN
				INSERT INTO [State]
					(Title, TitleGSTR,TitleEWay,Code,CountryId, Active)
				VALUES
					(@Title, @TitleGSTR,@TitleEWay,@Code,@CountryId, @Active)

				SET @Id = SCOPE_IDENTITY()
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