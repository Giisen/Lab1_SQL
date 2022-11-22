use Bokhandel;
--drop view [AnställningstidPerButik] 
GO
create view [AnställningstidPerButik] 
as
select distinct
t1.ButiksNamn,
Count(distinct(t2.PersonalID)) as TotalAntalAnställda,
avg(case 
when A_Tom not like '9999-12-31' then datediff(month,A_From,A_Tom)
else datediff(month,A_From,CONVERT(date, SYSDATETIME()))
end) as Snitt_Antal_Månader

from Butiker t1
join Personal t2
on t1.ButikID=t2.ButikID

group by
t1.ButiksNamn

