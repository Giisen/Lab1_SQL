use Bokhandel;

select 
concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År') as Ålder,
count(distinct(t2.Titel)) as Titlar,
concat(sum(case when t3.Antal>0 then t2.Pris*t3.Antal else 0  end),' Kr') as Lagervärde
from Författare t1 

left join Böcker t2
on t1.ID=t2.FörfattareID 

left join LagerSaldo t3
on t2.ISBN13=t3.ISBN13

group by
concat(t1.Förnamn,' ', t1.EfterNamn),
concat(DateDiff(year,t1.Födelsedatum,convert(date,getdate())),' År')
order by 
concat(sum(case when t3.Antal>0 then t2.Pris*t3.Antal else 0  end),' Kr');

