CREATE TABLE [dbo].[SPNThresholds] (
  [spnthresholdsID] [int] IDENTITY,
  [spnID] [int] NOT NULL,
  [start] [datetime] NOT NULL,
  [IVR] [int] NOT NULL,
  [Short] [int] NOT NULL,
  [Long] [int] NOT NULL,
  [comments] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [created] [datetime] NOT NULL CONSTRAINT [DF_spnThresholds_created] DEFAULT (getdate()),
  CONSTRAINT [PK_spnThresholds] PRIMARY KEY CLUSTERED ([spnthresholdsID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_spnThresholds]
  ON [dbo].[SPNThresholds] ([spnID], [start])
  ON [PRIMARY]
GO