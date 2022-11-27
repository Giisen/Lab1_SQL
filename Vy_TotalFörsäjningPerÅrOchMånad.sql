use Bokhandel;
--drop view [TotalF�rs�ljningPer�rOchM�nad] 
GO
create view [TotalF�rs�ljningPer�rOchM�nad] 
as
select distinct
t2.ButiksNamn,
year(t1.OrderTid) as �r,
month(t1.OrderTid) as M�nad,
sum(t1.Antal) as Antal,
format(sum(t1.Antal*t1.Styckpris),'C0','se') as Summa


from Ordrar t1
join Butiker t2
on t1.ButikID=t2.ButikID

group by 
t2.ButiksNamn,
year(OrderTid),
month(t1.OrderTid);
