use Bokhandel;
--drop view [LagerSaldoBokformPerButik] 
GO
create view [LagerSaldoBokformPerButik] 
as
select distinct
t3.ButiksNamn,
t1.BokForm,
sum(t2.Antal) as Antal

from Bokform t1
join LagerSaldo t2
on t1.FormID=t2.FormID

join Butiker t3
on t2.ButikID=t3.ButikID

group by
t1.BokForm,
t3.ButiksNamn

