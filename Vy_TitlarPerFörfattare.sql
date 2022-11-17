
CREATE VIEW TitlarPerF�rfattare 
as 
select
concat(t1.F�rnamn,' ', t1.EfterNamn) as Namn,
--Convert(date,sysdatetime)-t1.F�delsedatum) as �lder
Count(t2.Titel) as Titlar,
sum(t2.Pris) as Lagerv�rde
from F�rfattare t1
left join B�cker t2
on t1.ID=t2.F�rfattareID
group by (t1.F�rnamn+' '+ t1.EfterNamn)
;
