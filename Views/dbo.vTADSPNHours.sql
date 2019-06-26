SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO





CREATE view [dbo].[vTADSPNHours] as 
Select 0 TADSPNHoursID,
S.SPN+' '+W.Name SPNAndName,
S.TAD+' '+T.tDesc Tad,H.START,
Left(CONVERT(varchar,H.MonS,114),8)MonS ,Left(CONVERT(varchar,H.MonE,114),8) MonE,  Left(CONVERT(varchar,H.TueS,114),8)TueS,Left(CONVERT(varchar,H.TueE,114),8) TueE,Left(CONVERT(varchar,H.WedS,114),8) WedS,Left(CONVERT(varchar,H.WedE,114),8) WedE,  Left(CONVERT(varchar,H.ThuS,114),8) ThuS,Left(CONVERT(varchar,H.ThuE,114),8) ThuE, Left(CONVERT(varchar,H.FriS,114),8)FriS,Left(CONVERT(varchar,H.FriE,114),8) FriE,  Left(CONVERT(varchar,H.SatS,114),8)SatS,Left(CONVERT(varchar,H.SatE,114),8) SatE,Left(CONVERT(varchar,H.SunS,114),8) SunS,Left(CONVERT(varchar,H.SunE,114),8) SunE
,S.SPN ,T.[Group] tadGroup,w.spnGroup,H.Comments,S.TAD tadvalue,0 [default]
From dbo.TADGroupHours H join Tad T on T.[Group]=H.[Group] 
join  SPNTAD S on T.TAD=S.TAD
join(
 select Name,SPN,startSPN,finishSPN,[Group]spnGroup From NumbersNew  
 ) w
on w.spn=s.spn and start between startSPN and finishSPN
 Left join TADSPNHours U on U.spn=S.SPN And U.TAD=S.TAD --and U.START= W.startSPN
--Where  U.start is null 
Union All

Select  TADSPNHoursID,
t.SPN + ' ' +W.Name SPNAndName,
t.TAD+' '+ tad.tDesc tad,convert(varchar,t.start,121)start, 
Left(CONVERT(varchar,t.MonS,114),8)MonS ,Left(CONVERT(varchar,t.MonE,114),8) MonE,  Left(CONVERT(varchar,t.TueS,114),8)TueS,Left(CONVERT(varchar,t.TueE,114),8) TueE,Left(CONVERT(varchar,t.WedS,114),8) WedS,Left(CONVERT(varchar,t.WedE,114),8) WedE,  Left(CONVERT(varchar,t.ThuS,114),8) ThuS,Left(CONVERT(varchar,t.ThuE,114),8) ThuE, Left(CONVERT(varchar,t.FriS,114),8)FriS,Left(CONVERT(varchar,t.FriE,114),8) FriE,  Left(CONVERT(varchar,t.SatS,114),8)SatS,Left(CONVERT(varchar,t.SatE,114),8) SatE,Left(CONVERT(varchar,t.SunS,114),8) SunS,Left(CONVERT(varchar,t.SunE,114),8) SunE
,t.SPN,tad.[Group]tadGroup, spnGroup,t.comments,tad.TAD tadvalue,t.[default]
From TADSPNHours t
join tad on tad.tad=t.tad
join(select Name,SPN,startSPN,finishSPN,[Group]spnGroup From NumbersNew) w
on w.spn=t.spn and start between startSPN and finishSPN



GO