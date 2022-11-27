use Bokhandel;
--drop view [TitlarPerFörfattare] 
GO
create view [TitlarPerFörfattare] 
as
select 
concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År') as Ålder,
count(distinct(t3.Titel)) as Titlar,
format(sum(t3.pris*t4.Antal),'C0','se') as Lagervärde
--Convert(int,sum(t3.pris*t4.Antal)) as Lagervärde2


from Författare t1 

join BöckerFörfattareJunction t2
on t1.ID=t2.FörfattareID 

join Böcker t3
on t3.ISBN13=t2.ISBN13

join LagerSaldo t4
on t2.ISBN13=t4.ISBN13

group by
concat(t1.Förnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År')
--order by Lagervärde2 desc
;

