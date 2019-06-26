CREATE TABLE [dbo].[InternalCLI] (
  [internalCLIid] [int] IDENTITY,
  [CLI] [varchar](20) NOT NULL,
  [CLIdescr] [varchar](50) NOT NULL CONSTRAINT [DF_internalCLI_CLIdescr] DEFAULT (''),
  [checked] [bit] NOT NULL CONSTRAINT [DF_internalCLI_checked] DEFAULT (0),
  CONSTRAINT [PK_internalCLI] PRIMARY KEY CLUSTERED ([internalCLIid])
)
ON [PRIMARY]
GO