CREATE TABLE [dbo].[main_20190401_20190411_Original] (
  [mainID] [int] NOT NULL,
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
  [OLDCLI4] [nvarchar](4) NULL,
  [NewCLI4] [nvarchar](4) NULL,
  [cLI4] [nvarchar](20) NULL
)
ON [PRIMARY]
GO