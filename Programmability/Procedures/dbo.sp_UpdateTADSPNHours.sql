SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE procedure [dbo].[sp_UpdateTADSPNHours]
@TADSPNhoursID as int=0,
@Tad as varchar(30),
@SPN as varchar(30),
@start as datetime,
@monE as datetime,
@monS as datetime,
@tueE as datetime,
@tueS as datetime,
@wedE as datetime,
@wedS as datetime,
@thuE as datetime,
@thuS as datetime,
@friE as datetime,
@friS as datetime,
@satE as datetime,
@satS as datetime,
@sunE as datetime,
@sunS as datetime,
@comments as varchar(8000)=' ',
@userName as varchar(50)=' ',
@default as bit =0
as
 
if @TADSPNhoursID>0 
--select mons,datepart(n,mons),Case when datepart(n,mons)=59 and datepart(ss,mons)=0 then DATEADD(ss,59,mons) else mons end from 
-- dbo.TAD 
update dbo.TADSPNhours set   [default]= @default,
monS=Case when datepart(n,@mons)=59 and datepart(ss,@mons)=0 then DATEADD(ss,59,@mons) else @mons end ,
monE=Case when datepart(n,@monE)=59 and datepart(ss,@monE)=0 then DATEADD(ss,59,@monE) else @monE end   ,
tueS=Case when datepart(n,@tues)=59 and datepart(ss,@tues)=0 then DATEADD(ss,59,@tues) else @tues end   ,  
tueE=Case when datepart(n,@tueE)=59 and datepart(ss,@tueE)=0 then DATEADD(ss,59,@tueE) else @tueE end  ,
wedS=Case when datepart(n,@weds)=59 and datepart(ss,@weds)=0 then DATEADD(ss,59,@weds) else @weds end   ,
wedE=Case when datepart(n,@wedE)=59 and datepart(ss,@wedE)=0 then DATEADD(ss,59,@wedE) else @wedE end   ,
thuS=Case when datepart(n,@thus)=59 and datepart(ss,@thus)=0 then DATEADD(ss,59,@thus) else @thus end ,
thuE=Case when datepart(n,@thuE)=59 and datepart(ss,@thuE)=0 then DATEADD(ss,59,@thuE) else @thuE end  ,
friS=Case when datepart(n,@friS)=59 and datepart(ss,@friS)=0 then DATEADD(ss,59,@friS) else @friS end  ,
friE=Case when datepart(n,@friE)=59 and datepart(ss,@friE)=0 then DATEADD(ss,59,@friE) else @friE end,
satS=Case when datepart(n,@satS)=59 and datepart(ss,@satS)=0 then DATEADD(ss,59,@satS) else @satS end ,
satE=Case when datepart(n,@satE)=59 and datepart(ss,@satE)=0 then DATEADD(ss,59,@satE) else @satE end ,
sunS=Case when datepart(n,@sunS)=59 and datepart(ss,@sunS)=0 then DATEADD(ss,59,@sunS) else @sunS end ,
sunE=Case when datepart(n,@sunE)=59 and datepart(ss,@sunE)=0 then DATEADD(ss,59,@sunE) else @sunE end,

 start=@start,comments=@comments,userName=@userName
where  TADSPNhoursID=@TADSPNhoursID
else
insert into dbo.TADSPNhours ( Start, SPN, TAD,  MonS, MonE, TueS, TueE, WedS, WedE, ThuS, ThuE, FriS,
 FriE, SatS, SatE, SunS, SunE, comments,userName )  
values ( @Start,@SPN,@TAD,
Case when datepart(n,@mons)=59 and datepart(ss,@mons)=0 then DATEADD(ss,59,@mons) else @mons end ,
Case when datepart(n,@monE)=59 and datepart(ss,@monE)=0 then DATEADD(ss,59,@monE) else @monE end   ,
Case when datepart(n,@tues)=59 and datepart(ss,@tues)=0 then DATEADD(ss,59,@tues) else @tues end   ,  
Case when datepart(n,@tueE)=59 and datepart(ss,@tueE)=0 then DATEADD(ss,59,@tueE) else @tueE end  ,
Case when datepart(n,@weds)=59 and datepart(ss,@weds)=0 then DATEADD(ss,59,@weds) else @weds end   ,
Case when datepart(n,@wedE)=59 and datepart(ss,@wedE)=0 then DATEADD(ss,59,@wedE) else @wedE end   ,
Case when datepart(n,@thus)=59 and datepart(ss,@thus)=0 then DATEADD(ss,59,@thus) else @thus end ,
Case when datepart(n,@thuE)=59 and datepart(ss,@thuE)=0 then DATEADD(ss,59,@thuE) else @thuE end  ,
Case when datepart(n,@friS)=59 and datepart(ss,@friS)=0 then DATEADD(ss,59,@friS) else @friS end  ,
Case when datepart(n,@friE)=59 and datepart(ss,@friE)=0 then DATEADD(ss,59,@friE) else @friE end,
Case when datepart(n,@satS)=59 and datepart(ss,@satS)=0 then DATEADD(ss,59,@satS) else @satS end ,
Case when datepart(n,@satE)=59 and datepart(ss,@satE)=0 then DATEADD(ss,59,@satE) else @satE end ,
Case when datepart(n,@sunS)=59 and datepart(ss,@sunS)=0 then DATEADD(ss,59,@sunS) else @sunS end ,
Case when datepart(n,@sunE)=59 and datepart(ss,@sunE)=0 then DATEADD(ss,59,@sunE) else @sunE end 
,
@comments,@userName )

return Case when @TADSPNhoursID=0 then @@identity else @TADSPNhoursID end

GO