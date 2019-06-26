SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- 1. create temporary file
--Drop table #a1
--Drop table #a
--Truncate table ST_L1.DBO.RetentionCoterminous
--Select * From   ST_L1.DBO.RetentionCoterminous order by delta
--Select * From   ST_L1.DBO.RetentionCoterminous where    recordtype=''
--Select * From   ST_L1.DBO.RetentionCoterminous where loopno=1 
-- stat by day calls to 0370 and 0800 
/*
select  DAY(start)day,sum(case when spn='03709003110' then 1 else 0 end)[03709003110],
sum(case when spn='08009809136' then 1 else 0 end)[08009809136],
sum(case when spn='08009809137' then 1 else 0 end)[08009809137]
 from #a group by DAY(start) order by 1
 SP_ST_L1.DBO.RetentionCoterminousTemp   @diffParamEndParentChildMin=1
 SP_ST_L1.DBO.RetentionCoterminousTemp   @diffParamEndParentChildMin=2
*/
CREATE Procedure 
[dbo].[SP_RetentionCoterminousTemp]   --@diffParamEndParentChildMin=2,@deltaParamMin=29
@deltaParamMin as int=19,
@deltaParamMax as int=75,
@diffParamEndParentChildMin as int=0

as
declare @dateStart as datetime,
@dateEnd as datetime
if @diffParamEndParentChildMin=0 
Truncate table ST_L1.DBO.RetentionCoterminous 
    Select @dateStart=MAX(start),@dateEnd=MIN(start) from rapportdb.dbo.tempCWgeneric
     where  spn in( '08009809136','08009809137','03709003110')
Select tmpIDgenericID mainID, start, duration,  SPN, TAD, CLI
 into #a1  from rapportdb.dbo.tempCWgeneric where -- start>=@dateStart  and start<dateadd(d,1,@dateEnd)  and
 spn in( '08009809136','08009809137','03709003110') and clientDBname='st_L1'
 
--Select * into #a  from #a1  
Delete from #a1 where mainid 
in(
select parentID from ST_L1.DBO.RetentionCoterminous where RecordType=''
Union 
select childID from ST_L1.DBO.RetentionCoterminous where RecordType=''
)


-- all Non Duplicate(ND) entries 08009809137
--drop table #nd7
select DAY(a.start)day,a.mainid  into #nd7--,mainid6,  start,DATEADD(s,duration,start)finish
 from #a1 a 
join (
select Mainid , spn ,start  ,DATEADD(s,duration,start)finish,
duration   from #a1 where spn in('08009809136','08009809137')
)b
on abs(datediff(s,DATEADD(s,a.duration,a.start),b.finish))=@diffParamEndParentChildMin
where a.spn='03709003110' and a.start<b.start and (a.duration-b.duration)between @deltaParamMin and @deltaParamMax
group by DAY(a.start),a.mainid
Having COUNT(*)=1  
order by 1,2
--Select '#nd7',* From #nd7
-- stat for 7 by day
--Select day,COUNT(*)[Exact by Finish 08009809137]from #nd7 group by day order by 1

-- all mainid for pair 03709003110 -  08009809137
--drop table #id7
select  a.mainID,b.mainID id7,a.duration-b.duration delta,'Longest Parent                       ' recordType
 into #id7
 from #a1 a 
join (
select Mainid,start,DATEADD(s,duration,start)finish,
duration   from #a1 where  spn in('08009809136','08009809137')
)b
on abs(datediff(s,DATEADD(s,a.duration,a.start),b.finish))=@diffParamEndParentChildMin
where a.mainid  in(select mainid from #nd7)
 and a.start<b.start and  (a.duration-b.duration)between @deltaParamMin and @deltaParamMax

-- Stat for duplication
/* 
select mainid,Count(*) from #id7 Group by mainid having count(*)>1 order by 1

select id7,Count(*) from #id7 Group by id7 having count(*)>1 order by 1
*/
 
-- all records with min delta have blank recordType
--Select '#id7',* From #id7

Update #id7 set recordType='' where mainid in(
Select a.mainid From #id7 a join 
(Select id7,MIN(delta)delta From #id7 Group by id7)b on a.id7=b.id7 and a.delta=b.delta
)


-- update recordType records with max(id) when  calls have the same time distance
Update #id7 set recordType='Equal Delta - Max Mainid'   where Mainid in(
select max(mainid)mainidTodelete from (
Select  
--a.id7,a.delta,b.delta,
a.mainID  mainid,a.id7 
 from #id7 a join #id7 b on a.id7=b.id7 where a.mainID<>b.mainID and a.delta=b.delta)a  
Group by id7)


Update  #id7 set recordType='Longest Child' where Mainid  in(
 select mainid  from #id7 Group by mainid having count(*)>1 ) 
 
 -- take the record with min mainid : two parents one child case
 Update  #id7 set recordType='' where id7  in(
 select min(id7)  from #id7 Group by mainid having count(*)>1 )
 
 --Truncate table ST_L1.DBO.RetentionCoterminous
 
 Insert into ST_L1.DBO.RetentionCoterminous(
StartDate, EndDate, ParentID, childID, deltaStartParentChild, RecordType, deltaParamMin, deltaParamMax, diffParamEndParentChildMin
  )
 Select @dateStart,@dateEnd,Mainid ParentID,id7 childID,delta,RecordType,@deltaParamMin,@deltaParamMax,@diffParamEndParentChildMin    from #id7 -- where recordType <>''
--drop table  ##ST_L1.DBO.RetentionCoterminous19 
--Select * into ##ST_L1.DBO.RetentionCoterminous  From   ST_L1.DBO.RetentionCoterminous 
--Select * into ##ST_L1.DBO.RetentionCoterminous19 From   ST_L1.DBO.RetentionCoterminous 
--Select * From   ##ST_L1.DBO.RetentionCoterminous19 where parentid in (Select parentid From    ST_L1.DBO.RetentionCoterminous )
GO