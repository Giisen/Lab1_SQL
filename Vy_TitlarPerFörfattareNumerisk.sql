use Bokhandel;

GO
Create view [TitlarPerF�rfattareNumerisk] 
as
select
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
DateDiff(year,t1.F�delsedatum,convert(date,getdate())) as [�lder(�r)],
count(distinct(t3.Titel)) as Titlar,
sum(t3.pris*t4.Antal) as [Lagerv�rde(Kr)]

from F�rfattare t1 

join B�ckerF�rfattareJunction t2
on t1.ID=t2.F�rfattareID 

join B�cker t3
on t3.ISBN13=t2.ISBN13

join LagerSaldo t4
on t2.ISBN13=t4.ISBN13

group by
concat(t1.F�rnamn,' ', t1.EfterNamn),
DateDiff(year,t1.F�delsedatum,convert(date,getdate()))

;