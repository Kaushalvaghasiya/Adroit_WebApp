CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwareSave]
(
	 @Id tinyint,
	 @Title VARCHAR(20),
	 @Active bit,
	 @OrderNumber tinyint
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Software WHERE Id = @Id)
			BEGIN
				UPDATE  Software SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM Software WHERE Title = @Title AND IsDeleted = 1)
			BEGIN
				UPDATE  Software SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						IsDeleted = 0
					WHERE Title = @Title

				SELECT @Id=Id FROM Software WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO Software
					([Title], OrderNumber, Active)
				VALUES
					(@Title, @OrderNumber, @Active)

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
			SET @message = 'Software ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO