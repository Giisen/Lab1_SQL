use Bokhandel;
--drop view [TotalF�rs�ljningPer�rOchM�nad] 
GO
create view [TotalF�rs�ljningPer�rOchM�nad] 
as
select distinct
t2.ButiksNamn,
year(t1.Tid) as �r,
month(t1.Tid) as M�nad,
sum(t3.Antal) as Antal,
format(sum(t3.Antal*t3.Styckpris),'C0','se') as Summa


from OrdrarInfo t1
join Butiker t2
on t1.ButikID=t2.ButikID

join Ordrar t3
on t1.OrderID=t3.OrderID

group by 
t2.ButiksNamn,
year(Tid),
month(t1.Tid);
