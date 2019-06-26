CREATE TABLE [dbo].[FulfilmentCosts] (
  [Product Area] [varchar](50) NOT NULL,
  [Incentive] [int] NOT NULL,
  [Quote pack] [int] NOT NULL,
  [Sales Pack] [int] NOT NULL,
  [Call Cost] [int] NOT NULL,
  CONSTRAINT [PK_FulfilmentCosts] PRIMARY KEY CLUSTERED ([Product Area])
)
ON [PRIMARY]
GO