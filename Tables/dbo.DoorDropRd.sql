CREATE TABLE [dbo].[DoorDropRd] (
  [SPN] [nvarchar](20) NOT NULL,
  [PCID] [nvarchar](10) NOT NULL,
  [Doordrops] [int] NULL,
  [creativerd] [nvarchar](50) NULL CONSTRAINT [DF_doorDropRd_creativerd] DEFAULT (N' '),
  CONSTRAINT [PK_doorDropRd] PRIMARY KEY CLUSTERED ([SPN], [PCID])
)
ON [PRIMARY]
GO