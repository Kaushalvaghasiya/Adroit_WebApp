CREATE OR ALTER PROCEDURE [dbo].[sp_SalesBillFromAdminSave]
(
	 @Id CHAR(1),
	 @Title VARCHAR(20),
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM SalesBillFromAdmin WHERE Id = @Id)
			BEGIN
				UPDATE  SalesBillFromAdmin SET
						Title = @Title,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM SalesBillFromAdmin WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  SalesBillFromAdmin SET
						Active = @active,
						Deleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM SalesBillFromAdmin WHERE Title = @Title 
			END
		ELSE
			BEGIN			
				SELECT @Id = Max(Id) + 1 from SalesBillFromAdmin 
				INSERT INTO SalesBillFromAdmin
					(Id, Title, Active)
				VALUES
					(@Id, @Title, @Active)

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
			SET @message = 'Stock type ''' + @Title + ''' already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO