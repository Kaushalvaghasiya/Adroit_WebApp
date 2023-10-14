CREATE OR ALTER PROCEDURE [dbo].[sp_BookTypeAdminSave]
(
	 @Id int,
	 @Title VARCHAR(50),
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM BookTypeAdmin WHERE Id = @Id)
			BEGIN
				UPDATE  BookTypeAdmin SET
						Title = @Title,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM BookTypeAdmin WHERE Title = @Title AND IsDeleted = 1)
			BEGIN
				UPDATE  BookTypeAdmin SET
						Active = @active,
						IsDeleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM BookTypeAdmin WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO BookTypeAdmin
					(Title, Active)
				VALUES
					(@Title,@Active)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Book type ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO