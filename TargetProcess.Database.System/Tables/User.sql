CREATE TABLE [dbo].[User]
(
	[TenantID] BIGINT           CONSTRAINT [DF_User_TenantID] DEFAULT ((911)) NOT NULL,
	[ID] BIGINT NOT NULL, 
	[LoginAccount] NVARCHAR(50),
	[Locked] TINYINT DEFAULT(0) NOT NULL,
	[Visibility] TINYINT DEFAULT(0) NOT NULL,
	[Username]		   NVARCHAR(128) NOT NULL,
    [Status]		   TINYINT NOT NULL,
	[DisplayName]	NVARCHAR(128) NOT NULL,
	[AccountEmailAddress] NVARCHAR(255),
	[AccountMobilePhone] NVARCHAR(255),
	[CreatedByID]      BIGINT              NOT NULL,
    [CreatedDateTime]  DATETIME2 (7)    NOT NULL,
    [ModifiedByID]     BIGINT              NOT NULL,
    [ModifiedDateTime] DATETIME2 (7)    NOT NULL,
	[ChangeTimestamp]  ROWVERSION,

    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([TenantID] ASC, [ID] ASC),
	CONSTRAINT FK_User_Status FOREIGN KEY (Status) REFERENCES [TinyEnum].[LoginStatus] (ID),
	CONSTRAINT [FK_User_Tenant] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant] ([ID]),
	CONSTRAINT [FK_User_User_CreatedBy] FOREIGN KEY ([TenantID], [CreatedByID]) REFERENCES [dbo].[User] ([TenantID], [ID]),
	CONSTRAINT [FK_User_User_ModifiedBy] FOREIGN KEY ([TenantID], [ModifiedByID]) REFERENCES [dbo].[User] ([TenantID], [ID])
)
GO
CREATE INDEX [IX_User_Tenant] ON [dbo].[User] ([TenantID])
GO
CREATE INDEX [IX_User_CreatedBy] ON [dbo].[User] ([TenantID], [CreatedByID])
GO
CREATE INDEX [IX_User_ModifiedBy] ON [dbo].[User] ([TenantID], [ModifiedByID])
