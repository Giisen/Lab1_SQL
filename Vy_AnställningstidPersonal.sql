use Bokhandel;
--drop view [AnställningstidPersonal] 
GO
create view [AnställningstidPersonal] 
as
select distinct
concat(t1.Förnamn,' ',t1.EfterNamn) as Namn,
case 
when A_Tom not like '9999-12-31' then datediff(month,A_From,A_Tom)
else datediff(month,A_From,CONVERT(date, SYSDATETIME()))
end as Anställningstid_Månader
from Personal t1
