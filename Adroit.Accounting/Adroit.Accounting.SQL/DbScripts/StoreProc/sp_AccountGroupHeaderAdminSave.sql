CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupHeaderAdminSave]
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
		IF EXISTS (SELECT 1 FROM AccountGroupHeaderAdmin WHERE Id = @Id)
			BEGIN
				UPDATE  AccountGroupHeaderAdmin SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM AccountGroupHeaderAdmin WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  AccountGroupHeaderAdmin SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						Deleted = 0
					WHERE Title = @Title

				SELECT @Id=Id FROM AccountGroupHeaderAdmin WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO AccountGroupHeaderAdmin
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
			SET @message = 'Main Account Group ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO