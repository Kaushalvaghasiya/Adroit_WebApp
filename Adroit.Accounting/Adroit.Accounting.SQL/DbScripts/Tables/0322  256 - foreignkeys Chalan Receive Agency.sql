IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]') 
			AND parent_object_id = OBJECT_ID(N'[dbo].[Z-ChalanReceiveAgencyDetail-Z]'))
ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] DROP CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-ChalanReceiveAgencyDetail-Z]'))
ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster] FOREIGN KEY([ChalanReceiveAgencyMasterId])
REFERENCES [dbo].[Z-ChalanReceiveAgencyMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-ChalanReceiveAgencyDetail-Z]'))
ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]
GO