SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
 CREATE procedure [dbo].[DrtvByRequestExport] --'20160601'
 as
Declare @dateFrom as datetime 
Declare @dateTo as datetime 
Declare @toDay  as datetime 
 Set @toDay=  Dateadd(d,0,datediff(d,0, GETDATE())) 
 --Set @toDay=Dateadd(m,-1,Dateadd(d,1 -datepart(d,@toDay),@toDay))
 set @dateFrom='20160601'
 --coalesce(
 --(select dateForExportWeekly from ST_L1.dbo.DatesForExport) ,Dateadd(m,-1,Dateadd(d,1 -datepart(d,@toDay),@toDay)))  

 
 set @dateTo='20161218'-- DATEADD(mm,1,@datefrom)
  --Update dbo.DatesForExport set dateForExportWeekly=@dateFrom
--select @toDay,@dateFrom,@dateTo 

Select SPN[Dialled Number],spndescr[Description],b.CLI [Caller No.]
,Convert(varchar(11),Dateadd(d,0,datediff(d,0,start)), 3)
 [Date],

Left(Cast (start as Time),8)[Call Start Time] ,
Case calltype when 'S' then 'Succ' when 'U' then 'Unans' else 'Eng' end
[Call Type],Duration [Tot Duration (secs)],case when isbar2='z_CORPORATE' then 'Unallocated' else isbar2 end  [TV Region]

from (Select 
 m.*   from main m where spn  in(select spn From drtvNumber) 
 and start between @dateFrom  and @dateTo) b
join   rapportdb.dbo.tvregionfullinfo t 
on t.tvid=b.tvid
left join internalCLI I on i.cli =b.CLI 
 where i.CLI is null 
Order by start
 --Select * from internalCLI
 
GO