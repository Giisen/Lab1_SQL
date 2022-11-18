use Bokhandel;

select 
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r') as �lder,
count(distinct(t2.Titel)) as Titlar,
format(sum(t2.pris*t3.Antal),'C0','se') as Lagerv�rde
--Concat(sum(t2.pris*t3.Antal),' kr') as Lagerv�rde
from F�rfattare t1 

left join B�cker t2
on t1.ID=t2.F�rfattareID 

left join LagerSaldo t3
on t2.ISBN13=t3.ISBN13

group by
concat(t1.F�rnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.F�delsedatum,convert(date,getdate())),' �r')
order by
sum(t2.pris*t3.Antal) desc;



