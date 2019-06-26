﻿CREATE TABLE [dbo].[AdSchedule] (
  [ID] [numeric] IDENTITY,
  [Number] [nvarchar](255) NOT NULL,
  [Media] [nvarchar](255) NULL,
  [Title] [nvarchar](255) NULL,
  [Date] [datetime] NOT NULL,
  [toDate] [datetime] NULL,
  [Creative] [nvarchar](255) NULL,
  [Format] [nvarchar](255) NULL,
  [Dummy1] [nvarchar](255) NULL,
  [Dummy2] [nvarchar](255) NULL,
  [Adverts] [float] NULL,
  [GrossCost] [money] NULL,
  [Client Cost (exc VAT)] [money] NULL,
  [PProdCost] [money] NULL,
  [Total Cost (exc Vat)] [money] NULL,
  [Response] [float] NULL,
  [PConversions] [float] NULL,
  [Audience] [float] NULL,
  [RR] [float] NULL,
  [CPR] [money] NULL,
  [CR] [float] NULL,
  [CPC] [money] NULL,
  [sCalls] [int] NULL,
  [MoreThenMin] [int] NULL,
  [MoreThenMax] [int] NULL,
  [day] [nvarchar](255) NULL,
  [type] [nvarchar](255) NULL,
  [position] [nvarchar](255) NULL,
  CONSTRAINT [PK_AdSchedule] PRIMARY KEY CLUSTERED ([Number], [Date])
)
ON [PRIMARY]
GO