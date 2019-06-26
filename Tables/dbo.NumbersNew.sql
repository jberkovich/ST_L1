CREATE TABLE [dbo].[NumbersNew] (
  [id] [int] IDENTITY,
  [Group] [nvarchar](50) NULL,
  [Name] [nvarchar](60) NOT NULL,
  [VDN] [int] NULL,
  [VDN Description] [nvarchar](50) NULL,
  [spn] [nvarchar](50) NOT NULL,
  [ProductNDX] [int] NULL,
  [twoLegs] [bit] NULL,
  [Active] [bit] NULL,
  [salesLine] [bit] NULL,
  [value] [int] NULL,
  [startSPN] [datetime] NULL,
  [FinishSPN] [datetime] NULL,
  CONSTRAINT [PK_NumbersNew_1] PRIMARY KEY NONCLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_LloydsNumbersnew]
  ON [dbo].[NumbersNew] ([id])
  ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [IX_Numbers]
  ON [dbo].[NumbersNew] ([spn], [Name], [startSPN])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

Create Trigger  [NumbersNew_trigger] 
on  [dbo].[NumbersNew]
for Update,delete 
As 
If Update([Group]) or  Update([Name]) or  Update([startSPN]) or  Update([finishSPN]) or  Update([value]) or  Update([salesLine])
Insert into [dbo].[NumbersNewAudit](

 [id], [Group], [Name], [VDN], [VDN Description], [spn], [ProductNDX], [Active], [twoLegs], [salesLine], [value], [startSPN], [finishSPN]

)
Select  b.[id],b.[Group],b.[Name],b.[VDN],b.[VDN Description],b.[spn],b.[ProductNDX],b.[Active],b.[twoLegs],b.[salesLine],b.[value],b.[startSPN],b.[finishSPN] from [dbo].[NumbersNew] a
join deleted b on a.id=b.id
Else
Insert into [dbo].NumbersNewAudit
(
 [id], [Group], [Name], [VDN], [VDN Description], [spn], [ProductNDX], [Active], [twoLegs], [salesLine], [value], [startSPN], [finishSPN],RecordType
)
Select  b.[id],b.[Group],b.[Name],b.[VDN],b.[VDN Description],b.[spn],b.[ProductNDX],b.[Active],b.[twoLegs],b.[salesLine],b.[value],b.[startSPN],b.[finishSPN],'Deleted' from  
  deleted b  
/*
select * from [dbo].[GroupSpecialDatesAudit]
Truncate table [dbo].[GroupSpecialDatesAudit]
*/
GO