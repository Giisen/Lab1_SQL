
declare @sysdate as date
--set @sysdate = convert(date,getdate());
set @sysdate = getdate();


select 

concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
convert(date,getdate()) as Sysdate,
--cast(getdate()) as Sysdate,
@sysdate-(t1.Födelsedatum) as Ålder
--Count(t2.Titel) as Titlar,
--sum(t2.Pris) as Lagervärde
--into #DivKalkuleringar
from Författare t1
left join Böcker t2
on t1.ID=t2.FörfattareID;


--CREATE VIEW TitlarPerFörfattare 
--as 
--select
--concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
----Date_format(From_days(DATEDIFF(now(),t1.Födelsedatum)),'%Y')+0 as Ålder,
----cast(getdate()) as Sysdate,
----(cast(getdate()) as Sysdate)-(t1.Födelsedatum) as Ålder,
--Count(t2.Titel) as Titlar,
--sum(t2.Pris) as Lagervärde
--from Författare t1
--left join Böcker t2
--on t1.ID=t2.FörfattareID
--group by 
--(t1.Förnamn+' '+ t1.EfterNamn),
--Cast(GETDATE())-(t1.Födelsedatum),
----Convert (date,sysdatetime())-(t1.Födelsedatum),
--Count(t2.Titel),
--sum(t2.Pris)
--;
