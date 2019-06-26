CREATE TABLE [dbo].[TADSPNhours20171204] (
  [TADSPNhoursID] [int] IDENTITY,
  [Start] [datetime] NOT NULL,
  [SPN] [nvarchar](50) NOT NULL,
  [TAD] [nvarchar](50) NOT NULL,
  [Department] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [tDesc] [nvarchar](50) NULL,
  [MonS] [datetime] NOT NULL,
  [MonE] [datetime] NOT NULL,
  [TueS] [datetime] NOT NULL,
  [TueE] [datetime] NOT NULL,
  [WedS] [datetime] NOT NULL,
  [WedE] [datetime] NOT NULL,
  [ThuS] [datetime] NOT NULL,
  [ThuE] [datetime] NOT NULL,
  [FriS] [datetime] NOT NULL,
  [FriE] [datetime] NOT NULL,
  [SatS] [datetime] NOT NULL,
  [SatE] [datetime] NOT NULL,
  [SunS] [datetime] NOT NULL,
  [SunE] [datetime] NOT NULL,
  [default] [bit] NOT NULL,
  [active] [bit] NOT NULL,
  [created] [datetime] NOT NULL,
  [comments] [varchar](8000) NOT NULL,
  [userName] [varchar](50) NOT NULL
)
ON [PRIMARY]
GO