use Bokhandel;



drop table #DivKalkuleringar1;

declare @sysdate as date
set @sysdate = getdate();
select

concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
t2.Titel,
convert(date,getdate()) as Sysdate,
concat(DateDiff(year,t1.Födelsedatum,@sysdate),' År') as Ålder
into #DivKalkuleringar1
from Författare t1
left join Böcker t2
on t1.ID=t2.FörfattareID;

select * from #DivKalkuleringar1;

drop table #DivKalkuleringar2;

select 
t1.Titel,
t2.Antal,
sum(t1.Pris)*t2.Antal as Lagervärde
into #DivKalkuleringar2
from Böcker t1
left join LagerSaldo t2
on 
t1.ISBN13=t2.ISBN13
group by
Titel,
Antal
;

select * from #DivKalkuleringar2;




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
