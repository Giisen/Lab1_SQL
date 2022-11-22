
Declare @FrånButik int
set @FrånButik=1;

Declare @TillButik int
set @TillButik=2;

Declare @ISBN13 nvarchar(max)
set @ISBN13=0000000000000;

Declare @FlyttaAntal int
set @FlyttaAntal=1;


Begin transaction;
use Bokhandel
Alter procedure FlyttaBok

update LagerSaldo

set Antal = Antal-@FlyttaAntal
--set Antal = Antal+@FlyttaAntal

where ButikID=@FrånButik and ISBN13 = @ISBN13

--and where ButikId=@TillButik


commit;

select * from LagerSaldo