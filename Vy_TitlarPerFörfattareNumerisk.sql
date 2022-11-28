use Bokhandel;

GO
Create view [TitlarPerFörfattareNumerisk] 
as
select
concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
DateDiff(year,t1.Födelsedatum,convert(date,getdate())) as [Ålder(År)],
count(distinct(t3.Titel)) as Titlar,
sum(t3.pris*t4.Antal) as [Lagervärde(Kr)]

from Författare t1 

join BöckerFörfattareJunction t2
on t1.ID=t2.FörfattareID 

join Böcker t3
on t3.ISBN13=t2.ISBN13

join LagerSaldo t4
on t2.ISBN13=t4.ISBN13

group by
concat(t1.Förnamn,' ', t1.EfterNamn),
DateDiff(year,t1.Födelsedatum,convert(date,getdate()))

;