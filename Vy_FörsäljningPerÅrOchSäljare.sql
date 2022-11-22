use Bokhandel;
--drop view [F�rs�ljningPer�rOchS�ljare] 
GO
create view [F�rs�ljningPer�rOchS�ljare] 
as
select distinct
concat(t2.F�rnamn,' ',t2.EfterNamn) as Namn,
year(t1.OrderTid) as �r,
sum(t1.Antal) as Antal,
format(sum(t1.Antal*t1.Styckpris),'C0','se') as Summa


from Ordrar t1
join Personal t2
on t1.PersonalID=t2.PersonalID

group by 
concat(t2.F�rnamn,' ',t2.EfterNamn),
year(OrderTid);