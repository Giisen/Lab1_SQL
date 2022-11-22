use Bokhandel;
--drop view [Anst�llningstidPersonal] 
GO
create view [Anst�llningstidPersonal] 
as
select distinct
concat(t1.F�rnamn,' ',t1.EfterNamn) as Namn,
case 
when A_Tom not like '9999-12-31' then datediff(month,A_From,A_Tom)
else datediff(month,A_From,CONVERT(date, SYSDATETIME()))
end as Anst�llningstid_M�nader
from Personal t1
