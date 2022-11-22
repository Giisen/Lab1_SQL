use Bokhandel;
--drop view [Anst�llningstidPerButik] 
GO
create view [Anst�llningstidPerButik] 
as
select distinct
t1.ButiksNamn,
Count(distinct(t2.PersonalID)) as TotalAntalAnst�llda,
avg(case 
when A_Tom not like '9999-12-31' then datediff(month,A_From,A_Tom)
else datediff(month,A_From,CONVERT(date, SYSDATETIME()))
end) as Snitt_Antal_M�nader

from Butiker t1
join Personal t2
on t1.ButikID=t2.ButikID

group by
t1.ButiksNamn

