
declare @sysdate as date
--set @sysdate = convert(date,getdate());
set @sysdate = getdate();


select 

concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
convert(date,getdate()) as Sysdate,
--cast(getdate()) as Sysdate,
@sysdate-(t1.F�delsedatum) as �lder
--Count(t2.Titel) as Titlar,
--sum(t2.Pris) as Lagerv�rde
--into #DivKalkuleringar
from F�rfattare t1
left join B�cker t2
on t1.ID=t2.F�rfattareID;


--CREATE VIEW TitlarPerF�rfattare 
--as 
--select
--concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
----Date_format(From_days(DATEDIFF(now(),t1.F�delsedatum)),'%Y')+0 as �lder,
----cast(getdate()) as Sysdate,
----(cast(getdate()) as Sysdate)-(t1.F�delsedatum) as �lder,
--Count(t2.Titel) as Titlar,
--sum(t2.Pris) as Lagerv�rde
--from F�rfattare t1
--left join B�cker t2
--on t1.ID=t2.F�rfattareID
--group by 
--(t1.F�rnamn+' '+ t1.EfterNamn),
--Cast(GETDATE())-(t1.F�delsedatum),
----Convert (date,sysdatetime())-(t1.F�delsedatum),
--Count(t2.Titel),
--sum(t2.Pris)
--;
