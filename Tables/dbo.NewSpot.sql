CREATE TABLE [dbo].[NewSpot] (
  [RefID] [int] IDENTITY,
  [DialledNo] [nvarchar](20) NOT NULL,
  [Channel] [nvarchar](50) NULL,
  [Date] [datetime] NOT NULL,
  [Time] [int] NULL,
  [PIP] [nchar](1) NULL,
  [PIB] [nchar](1) NULL,
  [SpotLengthsec] [float] NULL,
  [CPT] [money] NULL,
  [Cost] [money] NULL,
  [EQImpacts] [int] NULL,
  [PrgName] [nvarchar](255) NULL,
  [Genre] [nvarchar](50) NULL,
  [Creative] [nvarchar](50) NULL,
  [Product] [nvarchar](50) NULL,
  [Daypart] [nvarchar](50) NULL,
  [TVR] [nvarchar](50) NULL,
  [FilmNo] [nvarchar](50) NULL,
  [Population] [float] NULL,
  [DayOfWeek] [nchar](3) NULL,
  [Dummy1] [nvarchar](50) NULL,
  [Dummy2] [nvarchar](50) NULL,
  [Dummy3] [nvarchar](50) NULL,
  [Active] [bit] NULL
)
ON [PRIMARY]
GO