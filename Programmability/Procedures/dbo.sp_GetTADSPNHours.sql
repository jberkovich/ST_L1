SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE Procedure [dbo].[sp_GetTADSPNHours] --'Yacob'
@userName as varchar(30)='yacob',
@order as varchar(20)  ='4,2,3'
as 
Exec  ('
 
 Select  distinct t.TADSPNHoursID	,t.SPNAndName	,t.TAD,convert(varchar(11),	t.START,121)START,
 	t.MonS,	t.MonE,	t.TueS	,t.TueE	,t.WedS,	t.WedE,	t.ThuS,	t.ThuE	,t.FriS,	t.FriE,	t.SatS	
 	,t.SatE	, t.SunS	,t.SunE,	t.SPN	,
 	(Select COUNT(*) from vTADSPNHours t join 
  RapportDB.['+@userName+'].vAvctiveClientActiveNumbers a on t.SPN=a.spnValue1) cnt
  ,comments,TadGroup
    from  vTADSPNHours t join 
  RapportDB.['+@userName+'].vAvctiveClientActiveNumbers a on t.SPN=a.spnValue1 order by ' +  @order )
 


GO