use Bokhandel;
--drop view [TotalFörsäljningPerÅr] 
GO
create view [TotalFörsäljningPerÅr] 
as
select distinct
t2.ButiksNamn,
year(t1.Tid) as År,
sum(t3.Antal) as Antal,
format(sum(t3.Antal*t3.Styckpris),'C0','se') as Summa


from OrdrarInfo t1
join Butiker t2
on t1.ButikID=t2.ButikID

join Ordrar t3
on t1.OrderID=t3.OrderID

group by 
t2.ButiksNamn,
year(Tid);

