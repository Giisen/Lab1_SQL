use Bokhandel;
--drop view [FörsäljningPerÅrOchSäljare] 
GO
create view [FörsäljningPerÅrOchSäljare] 
as
select distinct
concat(t2.Förnamn,' ',t2.EfterNamn) as Namn,
year(t1.OrderTid) as År,
sum(t1.Antal) as Antal,
format(sum(t1.Antal*t1.Styckpris),'C0','se') as Summa


from Ordrar t1
join Personal t2
on t1.PersonalID=t2.PersonalID

group by 
concat(t2.Förnamn,' ',t2.EfterNamn),
year(OrderTid);