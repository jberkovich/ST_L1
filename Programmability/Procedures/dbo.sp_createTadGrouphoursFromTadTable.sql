SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE Procedure [dbo].[sp_createTadGrouphoursFromTadTable] as
truncate table TADGroupHours
insert into dbo.TADGroupHours
( start, [Group], MonS, MonE, TueS, TueE, WedS, WedE, ThuS, ThuE, FriS, FriE, SatS, SatE, SunS, SunE)
Select distinct  '20010101',[Group], MonS, MonE, TueS, TueE, WedS, WedE, ThuS, ThuE, FriS, 
FriE, SatS, SatE, SunS, SunE
From Tad  


Truncate table spntad
insert into spntad(spn,tad)
select distinct spn,tad from main where not(tad is null or spn is null) and  start >= '20110101'

/*
0121-Birmingham  
02920 Cardiff
01473 Ipswich
unknown hours =Cardiff hours
*/
 
GO