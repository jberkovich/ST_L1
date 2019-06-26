CREATE TABLE [dbo].[Main_20190401_20190411_Upl20190502_NewVersion] (
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
  [CLI4] [nchar](16) NULL,
  CONSTRAINT [PK_Main_20190401_20190411_Upl20190502_NewVersion] PRIMARY KEY CLUSTERED ([mainID]),
  CONSTRAINT [IX_Main_20190401_20190411_Upl20190502_NewVersion] UNIQUE ([tvid], [duration], [calltype], [SPN], [start], [TAD], [CLI], [corrid])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_startMain_20190401_20190411_Upl20190502_NewVersion]
  ON [dbo].[Main_20190401_20190411_Upl20190502_NewVersion] ([start])
  ON [PRIMARY]
GO

CREATE INDEX [IX_startTelefonicaMain_20190401_20190411_Upl20190502_NewVersion]
  ON [dbo].[Main_20190401_20190411_Upl20190502_NewVersion] ([start])
  ON [PRIMARY]
GO