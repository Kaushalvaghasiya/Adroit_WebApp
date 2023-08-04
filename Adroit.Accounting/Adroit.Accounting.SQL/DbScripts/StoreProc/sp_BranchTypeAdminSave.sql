CREATE OR ALTER PROCEDURE [dbo].[sp_BranchTypeAdminSave]
(
	 @Id tinyint,
	 @Title VARCHAR(200),
	 @Active bit,
	 @OrderNumber tinyint
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Business WHERE Id = @Id)
			BEGIN
				UPDATE FirmBranchTypeAdmin SET
					Title = @Title,
					OrderNumber = @OrderNumber,
					Active = @active
				WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM Business WHERE Title = @Title AND IsDeleted = 1)
			BEGIN
				SELECT @Id=Id FROM Business WHERE Title = @Title
				UPDATE FirmBranchTypeAdmin SET
					OrderNumber = @OrderNumber,
					Active = @Active,
					IsDeleted = 0
				WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO FirmBranchTypeAdmin
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
			SET @message = 'Branch type ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO