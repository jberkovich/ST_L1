CREATE TABLE [dbo].[DatesForExport] (
  [dateForExportDaily] [datetime] NULL,
  [dateForExportWeekly] [datetime] NULL,
  [dateForExportFrom] [datetime] NULL,
  [dateForExportTo] [datetime] NULL,
  [ForceToRun] [int] NULL CONSTRAINT [DF_DatesForExport_ForceToRun] DEFAULT (0)
)
ON [PRIMARY]
GO