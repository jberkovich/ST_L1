CREATE TABLE [dbo].[NumbersNewAudit] (
  [NumbersNewAuditID] [int] IDENTITY,
  [id] [int] NOT NULL,
  [Group] [nvarchar](50) NOT NULL,
  [Name] [nvarchar](200) NOT NULL,
  [VDN] [int] NULL,
  [VDN Description] [nvarchar](50) NULL,
  [spn] [nvarchar](50) NOT NULL,
  [ProductNDX] [int] NULL,
  [Active] [bit] NULL,
  [twoLegs] [bit] NULL,
  [salesLine] [bit] NULL,
  [value] [int] NULL,
  [startSPN] [datetime] NULL,
  [finishSPN] [datetime] NULL,
  [RecordType] [varchar](10) NOT NULL CONSTRAINT [DF_NumbersNewAudit_RecordType] DEFAULT ('updated'),
  [Created] [datetime] NOT NULL CONSTRAINT [DF_NumbersNewAudit_Created] DEFAULT (getdate()),
  CONSTRAINT [PK_NumbersNewAudit] PRIMARY KEY CLUSTERED ([NumbersNewAuditID])
)
ON [PRIMARY]
GO