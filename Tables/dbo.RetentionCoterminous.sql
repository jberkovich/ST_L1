CREATE TABLE [dbo].[RetentionCoterminous] (
  [RetentionCoterminousID] [int] IDENTITY,
  [StartDate] [date] NOT NULL,
  [EndDate] [date] NOT NULL,
  [ParentID] [int] NOT NULL,
  [childID] [int] NOT NULL,
  [deltaStartParentChild] [int] NOT NULL,
  [RecordType] [varchar](50) NOT NULL,
  [deltaParamMin] [int] NOT NULL,
  [deltaParamMax] [int] NOT NULL,
  [diffParamEndParentChildMin] [int] NOT NULL,
  [Created] [datetime] NOT NULL CONSTRAINT [DF_RetentionCoterminous_Created] DEFAULT (getdate()),
  CONSTRAINT [PK_RetentionCoterminous_1] PRIMARY KEY CLUSTERED ([RetentionCoterminousID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_RetentionCoterminous]
  ON [dbo].[RetentionCoterminous] ([ParentID], [childID])
  ON [PRIMARY]
GO