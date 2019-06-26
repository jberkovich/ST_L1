CREATE TABLE [dbo].[TADGroupHours] (
  [TADGroupHoursID] [int] IDENTITY,
  [start] [datetime] NOT NULL,
  [Group] [nvarchar](50) NOT NULL CONSTRAINT [DF_TADGroupHours_Group] DEFAULT ('unknown'),
  [MonS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_MonS] DEFAULT ('08:00'),
  [MonE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_MonE] DEFAULT ('20:00'),
  [TueS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_TueS] DEFAULT ('08:00'),
  [TueE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_TueE] DEFAULT ('20:00'),
  [WedS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_WedS] DEFAULT ('08:00'),
  [WedE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_WedE] DEFAULT ('20:00'),
  [ThuS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_ThuS] DEFAULT ('08:00'),
  [ThuE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_ThuE] DEFAULT ('20:00'),
  [FriS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_FriS] DEFAULT ('08:00'),
  [FriE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_FriE] DEFAULT ('20:00'),
  [SatS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_SatS] DEFAULT ('09:00'),
  [SatE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_SatE] DEFAULT ('17:00'),
  [SunS] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_SunS] DEFAULT ('23:59:58'),
  [SunE] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_SunE] DEFAULT ('23:59:59'),
  [created] [datetime] NOT NULL CONSTRAINT [DF_TADGroupHours_created] DEFAULT (getdate()),
  [addedManualy] [int] NOT NULL CONSTRAINT [DF_TADGroupHours_addedManualy] DEFAULT (0),
  [comments] [varchar](8000) NOT NULL CONSTRAINT [DF_TADGroupHours_comments] DEFAULT (' '),
  [userName] [varchar](50) NOT NULL CONSTRAINT [DF_TADGroupHours_userName] DEFAULT (' '),
  CONSTRAINT [PK_TADGroupHours] PRIMARY KEY CLUSTERED ([TADGroupHoursID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_TADGroupHours]
  ON [dbo].[TADGroupHours] ([Group], [start])
  ON [PRIMARY]
GO