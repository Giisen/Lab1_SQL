create procedure FlyttaBok
as
Go
Begin transaction;

use Bokhandel

Declare @FrånButik int
set @FrånButik=2;

Declare @TillButik int
set @TillButik=1;

Declare @ISBN13 nvarchar(13)
set @ISBN13='9780099537090';

Declare @FlyttaAntal int
set @FlyttaAntal=1;

GO:
update LagerSaldo
set Antal = Antal-@FlyttaAntal
where ButikID=@FrånButik and ISBN13 = @ISBN13


update LagerSaldo
set Antal = Antal+@FlyttaAntal
where ButikID=@TillButik and ISBN13 = @ISBN13

commit;

