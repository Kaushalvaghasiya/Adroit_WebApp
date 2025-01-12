CREATE OR ALTER PROCEDURE [dbo].[sp_CitySave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @TalukaId INT,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM City WHERE Id = @Id)
			BEGIN
				UPDATE  City SET
						Title = @Title,
						TalukaId = @TalukaId,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM City WHERE Title = @Title AND TalukaId=@TalukaId)
			BEGIN
				declare @errorMessage VARCHAR(4000);
				SET @errorMessage = 'City ''' + @Title + ''' already exist!';
				RAISERROR ('%s', 16, 1,@errorMessage);
			END
		ELSE
			BEGIN
				INSERT INTO City
					(Title, TalukaId, Active)
				VALUES
					(@Title, @TalukaId, @Active)

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