CREATE TABLE [dbo].[Main] (
  [mainID] [int] IDENTITY,
  [corrid] [int] NOT NULL,
  [tvid] [smallint] NOT NULL,
  [start] [datetime] NOT NULL,
  [duration] [int] NULL,
  [calltype] [nvarchar](1) NULL,
  [SPN] [nvarchar](16) NOT NULL,
  [TAD] [nvarchar](26) NULL,
  [CLI] [nvarchar](16) NOT NULL,
  [Telco] [nvarchar](50) NULL,
  [TAD4] [nvarchar](50) NULL,
  [TTA] [real] NULL,
  [PostCode] [nvarchar](10) NULL,
  [DCC] [real] NULL,
  [netIVRduration] [int] NULL,
  [duration89] [int] NULL,
  [ooh] [bit] NULL,
  [spnGr] [nvarchar](50) NULL,
  [spnDescr] [nvarchar](100) NULL,
  [spnID] [int] NULL,
  [TerminationReason] [nvarchar](50) NULL,
  CONSTRAINT [PK_Main] PRIMARY KEY CLUSTERED ([mainID]),
  CONSTRAINT [IX_Main] UNIQUE ([tvid], [duration], [calltype], [SPN], [start], [TAD], [CLI], [corrid])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_start]
  ON [dbo].[Main] ([start])
  ON [PRIMARY]
GO