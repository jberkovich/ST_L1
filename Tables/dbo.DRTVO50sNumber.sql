CREATE TABLE [dbo].[DRTVO50sNumber] (
  [drtvNumberID] [int] IDENTITY,
  [SPN] [varchar](16) NOT NULL,
  [Created] [datetime] NOT NULL CONSTRAINT [DF_drtvNumber_Created] DEFAULT (getdate()),
  CONSTRAINT [PK_drtvNumber] PRIMARY KEY CLUSTERED ([SPN])
)
ON [PRIMARY]
GO