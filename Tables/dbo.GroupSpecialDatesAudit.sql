CREATE TABLE [dbo].[GroupSpecialDatesAudit] (
  [GroupSpecialDatesAuditID] [int] IDENTITY,
  [GroupSpecialDatesID] [int] NOT NULL,
  [Group] [nvarchar](50) NOT NULL,
  [Date] [datetime] NOT NULL,
  [hDesc] [nvarchar](50) NOT NULL,
  [Start] [datetime] NOT NULL,
  [End] [datetime] NOT NULL,
  [Created] [datetime] NOT NULL CONSTRAINT [DF_GroupSpecialDatesAudit_Created] DEFAULT (getdate()),
  CONSTRAINT [PK_TadSpecialDatesGroupSpecialDatesAudit] PRIMARY KEY CLUSTERED ([GroupSpecialDatesAuditID], [Group], [Created])
)
ON [PRIMARY]
GO