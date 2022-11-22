use Bokhandel;
--drop view [TitlarPerGenre] 
GO
create view [TitlarPerGenre] 
as
select distinct
t1.Genre,
sum(t4.Antal) as Antal,
format(sum(t3.pris*t4.Antal),'C0','se') as Lagervärde

from Genre t1 

join BöckerGenreJunction t2
on t1.GenreID=t2.GenreID 

join Böcker t3
on t3.ISBN13=t2.ISBN13

join LagerSaldo t4
on t3.ISBN13=t4.ISBN13

group by
t1.Genre;
