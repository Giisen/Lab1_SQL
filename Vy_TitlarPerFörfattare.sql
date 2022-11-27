use Bokhandel;
--drop view [TitlarPerF�rfattare] 
GO
create view [TitlarPerF�rfattare] 
as
select 
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r') as �lder,
count(distinct(t3.Titel)) as Titlar,
format(sum(t3.pris*t4.Antal),'C0','se') as Lagerv�rde
--Convert(int,sum(t3.pris*t4.Antal)) as Lagerv�rde2


from F�rfattare t1 

join B�ckerF�rfattareJunction t2
on t1.ID=t2.F�rfattareID 

join B�cker t3
on t3.ISBN13=t2.ISBN13

join LagerSaldo t4
on t2.ISBN13=t4.ISBN13

group by
concat(t1.F�rnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r')
--order by Lagerv�rde2 desc
;

