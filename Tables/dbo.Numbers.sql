CREATE TABLE [dbo].[Numbers] (
  [id] [int] IDENTITY,
  [Group] [nvarchar](50) NULL CONSTRAINT [DF_Numbers_Group] DEFAULT (1),
  [Name] [nvarchar](60) NOT NULL,
  [VDN] [int] NULL CONSTRAINT [DF_Numbers_VDN] DEFAULT (1),
  [VDN Description] [nvarchar](50) NULL,
  [spn] [nvarchar](50) NOT NULL,
  [ProductNDX] [int] NULL CONSTRAINT [DF_Numbers_ProductNDX] DEFAULT (1),
  [twoLegs] [bit] NULL CONSTRAINT [DF_Numbers_twoLegs] DEFAULT (0),
  [Active] [bit] NULL CONSTRAINT [DF_Numbers_Active] DEFAULT (1),
  [superGroupNo] [int] NULL,
  [timestamp] [datetime] NULL CONSTRAINT [DF_Numbers_timestamp] DEFAULT (getdate()),
  [salesLine] [bit] NULL CONSTRAINT [DF_Numbers_salesLine] DEFAULT (0),
  [value] [int] NULL CONSTRAINT [DF_Numbers_value] DEFAULT (0),
  [startSPN] [datetime] NULL CONSTRAINT [DF_Numbers_startSPN] DEFAULT ('20000101'),
  [FinishSPN] [datetime] NULL CONSTRAINT [DF_Numbers_FinishSPN] DEFAULT ('20991231'),
  CONSTRAINT [PK_Numbers] PRIMARY KEY NONCLUSTERED ([spn])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_LloydsNumbers]
  ON [dbo].[Numbers] ([id])
  ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [IX_Numbers]
  ON [dbo].[Numbers] ([spn])
  ON [PRIMARY]
GO