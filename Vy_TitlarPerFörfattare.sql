use Bokhandel;
--drop view [TitlarPerFörfattare] 
GO
create view [TitlarPerFörfattare] 
as
select 
concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År') as Ålder,
count(distinct(t2.Titel)) as Titlar,
format(sum(t2.pris*t3.Antal),'C0','se') as Lagervärde
--format(sum(t2.pris*t3.Antal),'C0','se') as Lagervärde

from FörfattareDim t1 

left join Böcker t2
on t1.ID=t2.FörfattareID 

left join LagerSaldo t3
on t2.ISBN13=t3.ISBN13

group by
concat(t1.Förnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År');



