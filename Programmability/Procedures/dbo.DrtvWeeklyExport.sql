SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
 CREATE procedure [dbo].[DrtvWeeklyExport]
 as
Declare @dateFrom as datetime 
Declare @dateTo as datetime 

 
 set @dateFrom=coalesce(
 (select dateForExportWeekly from ST_L1.dbo.DatesForExport) ,DATEADD(dd,-6+2 -(DATEPART(dw,Dateadd(d,0,datediff(d,0,GETDATE())))-1), Dateadd(d,0,datediff(d,0,GETDATE())))  

  )
 set @dateTo= DATEADD(d,7,@datefrom)
  --Update dbo.DatesForExport set dateForExportWeekly=@dateFrom


Select SPN[Dialled Number],spndescr[Description],CLI [Caller No.]
,Convert(varchar(11),Dateadd(d,0,datediff(d,0,start)), 3)
 [Date],

Left(Cast (start as Time),8)[Call Start Time] ,
Case calltype when 'S' then 'Succ' when 'U' then 'Unans' else 'Eng' end
[Call Type],Duration [Tot Duration (secs)],case when isbar2='z_CORPORATE' then 'Unallocated' else isbar2 end  [TV Region]

from (Select 
 *   from main where spn  in(select spn From drtvNumber) 
 and start between @dateFrom  and @dateTo) b
join   rapportdb.dbo.tvregionfullinfo t  
on t.tvid=b.tvid  
Order by start
 
 
GO