CREATE TABLE [dbo].[DoorDropBig] (
  [SPN] [nvarchar](20) NOT NULL,
  [SectorID] [nvarchar](10) NOT NULL,
  [Doordrops] [int] NULL,
  [date] [datetime] NULL,
  [Creative] [nvarchar](100) NULL,
  [Dummy] [nvarchar](100) NULL,
  [Place] [nvarchar](50) NULL,
  [Target] [decimal](7, 2) NULL,
  [Index] [int] NULL,
  CONSTRAINT [PK_doorDropBig] PRIMARY KEY CLUSTERED ([SPN], [SectorID])
)
ON [PRIMARY]
GO