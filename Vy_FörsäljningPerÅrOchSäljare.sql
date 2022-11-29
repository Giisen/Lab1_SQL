use Bokhandel;
--drop view [FörsäljningPerÅrOchSäljare] 
GO
create view [FörsäljningPerÅrOchSäljare] 
as
select distinct
concat(t2.Förnamn,' ',t2.EfterNamn) as Namn,
year(t1.Tid) as År,
sum(t3.Antal) as Antal,
format(sum(t3.Antal*t3.Styckpris),'C0','se') as Summa


from OrdrarInfo t1
join Personal t2
on t1.PersonalID=t2.PersonalID

join Ordrar t3
on t1.OrderID=t3.OrderID

group by 
concat(t2.Förnamn,' ',t2.EfterNamn),
year(t1.Tid);


select * from FörsäljningPerÅrOchSäljare