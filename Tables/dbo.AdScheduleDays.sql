CREATE TABLE [dbo].[AdScheduleDays] (
  [Creative] [nvarchar](255) NOT NULL,
  [days] [int] NOT NULL,
  CONSTRAINT [PK_adScheduleDays] PRIMARY KEY CLUSTERED ([Creative])
)
ON [PRIMARY]
GO