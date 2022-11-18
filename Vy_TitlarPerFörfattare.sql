use Bokhandel;




declare @sysdate as date
set @sysdate = getdate();



drop table #DivKalkuleringar1;

select 
--t1.ID,
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r') as �lder,
count(t2.Titel) as Titlar,
concat(sum(case when t3.Antal>0 then t2.Pris*t3.Antal else 0  end),' Kr') as Lagerv�rde
from F�rfattare t1 

left join B�cker t2
on t1.ID=t2.F�rfattareID 

left join LagerSaldo t3
on t2.ISBN13=t3.ISBN13

group by
--t1.ID,
concat(t1.F�rnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r')
;



select
t1.ID,
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
--count(distinct(t2.Titel)) as Titlar,
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r') as �lder
into #DivKalkuleringar1
from F�rfattare t1
left join B�cker t2
on t1.ID=t2.F�rfattareID;

select * from #DivKalkuleringar1;


drop table #DivKalkuleringar2;

select 
t1.Titel,
t2.Antal,
sum(t1.Pris)*t2.Antal as Lagerv�rde
into #DivKalkuleringar3
from B�cker t1
left join LagerSaldo t2
on 
t1.ISBN13=t2.ISBN13
group by
Titel,
Antal
;

select * from #DivKalkuleringar2;




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




--Subquerys

--select 
--Namn,
--Titlar
--from
--(select
--concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
--count(distinct(t2.Titel)) as Titlar
----concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r') as �lder
--from F�rfattare t1 
--left join B�cker t2
--on t1.ID=t2.F�rfattareID) F�rfattare
--group by
--Namn
--;