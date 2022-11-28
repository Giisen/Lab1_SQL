create procedure SP_FlyttaBok
@Fr�nButik int,
@TillButik int,
@ISBN13 nvarchar(13),
@FlyttaAntal int =1
as

Begin transaction;

update LagerSaldo
set Antal = Antal-@FlyttaAntal
where ButikID=@Fr�nButik and ISBN13 = @ISBN13

Declare @RowsAffected int
set @RowsAffected= @@ROWCOUNT;

update LagerSaldo
set Antal = Antal+@FlyttaAntal
where ButikID=@TillButik and ISBN13 = @ISBN13

set @RowsAffected +=@@ROWCOUNT;

If (@RowsAffected=2)
commit
else rollback;

--exec SP_FlyttaBok @Fr�nbutik=1,@TillButik=2,@ISBN13='9780099537090',@FlyttaAntal=1;

