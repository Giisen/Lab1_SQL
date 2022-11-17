
CREATE VIEW TitlarPerFörfattare 
as 
select
concat(t1.Förnamn,' ', t1.EfterNamn) as Namn,
--Convert(date,sysdatetime)-t1.Födelsedatum) as Ålder
Count(t2.Titel) as Titlar,
sum(t2.Pris) as Lagervärde
from Författare t1
left join Böcker t2
on t1.ID=t2.FörfattareID
group by (t1.Förnamn+' '+ t1.EfterNamn)
;
