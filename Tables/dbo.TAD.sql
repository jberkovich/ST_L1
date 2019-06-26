CREATE TABLE [dbo].[TAD] (
  [Group] [nvarchar](50) NOT NULL CONSTRAINT [DF_TAD_Group] DEFAULT ('unknown'),
  [TAD] [nvarchar](50) NOT NULL,
  [Department] [nvarchar](500) NOT NULL CONSTRAINT [DF_TAD_Department] DEFAULT (N'LegalAndGeneral'),
  [tDesc] [nvarchar](50) NOT NULL CONSTRAINT [DF_TAD_tDesc] DEFAULT (N'unknown'),
  [MonS] [datetime] NOT NULL CONSTRAINT [DF_TAD_MonS] DEFAULT ('08:00'),
  [MonE] [datetime] NOT NULL CONSTRAINT [DF_TAD_MonE] DEFAULT ('20:00'),
  [TueS] [datetime] NOT NULL CONSTRAINT [DF_TAD_TueS] DEFAULT ('08:00'),
  [TueE] [datetime] NOT NULL CONSTRAINT [DF_TAD_TueE] DEFAULT ('20:00'),
  [WedS] [datetime] NOT NULL CONSTRAINT [DF_TAD_WedS] DEFAULT ('08:00'),
  [WedE] [datetime] NOT NULL CONSTRAINT [DF_TAD_WedE] DEFAULT ('20:00'),
  [ThuS] [datetime] NOT NULL CONSTRAINT [DF_TAD_ThuS] DEFAULT ('08:00'),
  [ThuE] [datetime] NOT NULL CONSTRAINT [DF_TAD_ThuE] DEFAULT ('20:00'),
  [FriS] [datetime] NOT NULL CONSTRAINT [DF_TAD_FriS] DEFAULT ('08:00'),
  [FriE] [datetime] NOT NULL CONSTRAINT [DF_TAD_FriE] DEFAULT ('18:00'),
  [SatS] [datetime] NOT NULL CONSTRAINT [DF_TAD_SatS] DEFAULT ('09:00'),
  [SatE] [datetime] NOT NULL CONSTRAINT [DF_TAD_SatE] DEFAULT ('17:00'),
  [SunS] [datetime] NOT NULL CONSTRAINT [DF_TAD_SunS] DEFAULT ('23:00'),
  [SunE] [datetime] NOT NULL CONSTRAINT [DF_TAD_SunE] DEFAULT ('23:00'),
  [default] [bit] NULL CONSTRAINT [DF_TAD_default] DEFAULT (0),
  [active] [bit] NULL CONSTRAINT [DF_TAD_active] DEFAULT (1),
  CONSTRAINT [PK_TAD] PRIMARY KEY CLUSTERED ([TAD])
)
ON [PRIMARY]
GO