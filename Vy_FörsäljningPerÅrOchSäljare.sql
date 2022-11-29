use Bokhandel;
--drop view [F�rs�ljningPer�rOchS�ljare] 
GO
create view [F�rs�ljningPer�rOchS�ljare] 
as
select distinct
concat(t2.F�rnamn,' ',t2.EfterNamn) as Namn,
year(t1.Tid) as �r,
sum(t3.Antal) as Antal,
format(sum(t3.Antal*t3.Styckpris),'C0','se') as Summa


from OrdrarInfo t1
join Personal t2
on t1.PersonalID=t2.PersonalID

join Ordrar t3
on t1.OrderID=t3.OrderID

group by 
concat(t2.F�rnamn,' ',t2.EfterNamn),
year(t1.Tid);


select * from F�rs�ljningPer�rOchS�ljare