CREATE TABLE [dbo].[numbersnew20170303] (
  [id] [int] IDENTITY,
  [Group] [nvarchar](50) NULL,
  [Name] [nvarchar](60) NOT NULL,
  [VDN] [int] NULL,
  [VDN Description] [nvarchar](50) NULL,
  [spn] [nvarchar](50) NOT NULL,
  [ProductNDX] [int] NULL,
  [twoLegs] [bit] NULL,
  [Active] [bit] NULL,
  [salesLine] [bit] NULL,
  [value] [int] NULL,
  [startSPN] [datetime] NULL,
  [FinishSPN] [datetime] NULL
)
ON [PRIMARY]
GO