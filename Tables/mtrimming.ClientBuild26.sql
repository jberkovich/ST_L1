CREATE TABLE [mtrimming].[ClientBuild26] (
  [ID] [int] IDENTITY,
  [clientID] [int] NOT NULL,
  [dimension1] [char](10) NULL,
  [dimension2] [char](10) NULL,
  [measureSeparate] [bit] NOT NULL CONSTRAINT [DF_ClientBuild_MeasureSeparate26] DEFAULT (1),
  [measures] [nvarchar](300) NULL,
  [comText] [nvarchar](255) NULL CONSTRAINT [DF_ClientBuild_comText26] DEFAULT (''),
  [LastDateRun] [datetime] NULL,
  CONSTRAINT [PK_ClientBuild26] PRIMARY KEY NONCLUSTERED ([ID]),
  CONSTRAINT [IX_ClientBuild26] UNIQUE ([clientID], [dimension1], [dimension2], [measures])
)
ON [PRIMARY]
GO