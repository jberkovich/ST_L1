SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
Create view [dbo].[TADGroup] as 
Select Top 100 percent * from  (Select distinct [Group] From dbo.TADGroupHours) T order by 1
GO