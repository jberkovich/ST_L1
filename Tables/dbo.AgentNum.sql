CREATE TABLE [dbo].[AgentNum] (
  [PHONEA] [nvarchar](255) NOT NULL,
  [ADDR1A] [nvarchar](255) NULL,
  [AGTNAA] [nvarchar](255) NULL,
  [ADDR2A] [nvarchar](255) NULL,
  [ADDR3A] [nvarchar](255) NULL,
  [PSTCDA] [nvarchar](255) NULL,
  [AGTMBA] [nvarchar](255) NULL,
  [AGTMNA] [nvarchar](50) NULL,
  [AGTYPA] [nvarchar](255) NULL,
  [AGTSTA] [nvarchar](255) NULL,
  CONSTRAINT [PK_agentNnum] PRIMARY KEY CLUSTERED ([PHONEA])
)
ON [PRIMARY]
GO