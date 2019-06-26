CREATE TABLE [dbo].[DRTVTERMNumber] (
  [drtvNumberID] [int] IDENTITY,
  [SPN] [varchar](16) NOT NULL,
  [Created] [datetime] NOT NULL CONSTRAINT [DF_drtvTERMNumber_Created] DEFAULT (getdate()),
  CONSTRAINT [PK_drtvTERMNumber] PRIMARY KEY CLUSTERED ([SPN])
)
ON [PRIMARY]
GO