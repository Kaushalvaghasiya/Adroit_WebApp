CREATE OR ALTER PROCEDURE [dbo].[sp_GSTCollectionSave]
(
	 @Id int,
	 @GSTNumber varchar(15), 
	 @Name nvarchar(200),	
	 @Address1 nvarchar(200),
	 @Address2 nvarchar(200),
	 @Address3 nvarchar(200),
	 @City nvarchar(50),
	 @Pincode varchar(10),
	 @Active bit
)	 
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GSTCollection WHERE Id = @Id)
			BEGIN
				UPDATE  GSTCollection SET
						GSTNumber = @GSTNumber,
						Name = @Name,
						Address1 = @Address1,
						Address2 = @Address2,
						Address3 = @Address3,
						City = @City,
						Pincode = @Pincode,
						Active = @Active
					WHERE ID = @Id
			END		
		ELSE
			BEGIN
				INSERT INTO GSTCollection
					(GSTNumber, Name, Address1, Address2, Address3, City, Pincode, AddedOn, Active)
				VALUES
					(@GSTNumber, @Name, @Address1, @Address2, @Address3, @City, @Pincode, GETUTCDATE(), @Active)

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
			SET @message = 'Collection ''' + @GSTNumber +' - ' + @Name + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO