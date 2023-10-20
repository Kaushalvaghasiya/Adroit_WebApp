CREATE OR ALTER PROCEDURE [dbo].[sp_GSTPortSave]
(
	 @Id int,
	 @Title VARCHAR(50),
	 @Code VARCHAR(10),
	 @OrderNumber tinyint,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GSTPort WHERE Id = @Id)
			BEGIN
				UPDATE  GSTPort SET
						Title = @Title,
						Code = @Code,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO GSTPort
					(Title, Code, OrderNumber, Active)
				VALUES
					(@Title, @Code, @OrderNumber, @Active)

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
			SET @message = 'Port ''' + @Title + ''' already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO