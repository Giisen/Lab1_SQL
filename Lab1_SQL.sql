--create database Bokhandel;
use Bokhandel;


--create table Personal(
--PersonalID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--AFormID int not null,
--A_From date not null,
--A_Tom date not null,
--ButikID int);


--create table Anst�llningsform
--(AFormID int IDENTITY(1,1) primary key,
--Anst�llningsform nvarchar(max)
--);


--insert into Anst�llningsform
--(Anst�llningsform)
--Values
--('Tillsvidare'),
--('Timanst�lld');

--create table Butiker(
--ButikID int IDENTITY(1,1) primary key,
--ButiksNamn nvarchar(max) not null,
--Gatuadress nvarchar(max) not null,
--Postnummer nvarchar(max) not null,
--Postort nvarchar(max) not null,
--Butikschef int not null
--);


--insert into Butiker
--(ButiksNamn,Gatuadress,Postnummer,Postort,Butikschef)
--Values
--('L�sh�rnan','Flygv�gen 1','42341','Torslanda',1),
--('Book on the beach','Strandv�gen 12','41719','�sa',4),
--('City Book','Paradgatan 8','51317','Stockholm',8),
--('Web','Lagerv�gen 3','13241','Flen',9)
--;


--insert into Personal
--(F�rnamn,Efternamn,AFormID,A_From,A_Tom,ButikID)
--Values
--('Krister','Ekelund',1,'19990101','99991231',1),
--('Niklas','Hjelm',2,'20220401','20220930',2),
--('Tova','Larsson',2,'20050601','99991231',3),
--('Eva','Ek',1,'20090701','99991231',2),
--('Bj�rn','Lindstr�m',1,'20100301','99991231',3),
--('Linda','Str�m',2,'20140601','20220301',3),
--('Karin','�rn',1,'20170801','99991231',1),
--('Olof','Nilsson',1,'20000201','99991231',3)
--('Conny','Svensson',1,'20050601','99991231',4);


--create table F�rfattare(
--ID int IDENTITY(1,1) primary key,
--Efternamn nvarchar(max) not null,
--F�rnamn nvarchar(max) not null,
--F�delsedatum date not null,
--);

--create table B�ckerF�rfattareJunction(
--ISBN13 nvarchar(13) foreign key (ISBN13) references B�cker(ISBN13),
--F�rfattareID int not null foreign key (F�rfattareID) references F�rfattare(ID));

--create table Bokform(
--FormID int IDENTITY(1,1) primary key,
--BokForm nvarchar(max) not null
--);


 --insert into Bokform
 --(Bokform)
 --Values
 --('Inbunden'),
 --('Pocket'),
 --('Audiobok'),
 --('Ebok');



--create table B�cker(
----BokID int identity(1,1) Primary key,
--ISBN13 nvarchar(13) Primary key,
--Titel nvarchar(max) not null,
--Spr�kID int not null,
--Pris int not null,
--Utgivningsdatum date not null,
----F�rfattarID int not null,
--FormID int not null,
--AntalSidor int,
----GenreID int
----constraint FK_F�rfattareID foreign key (F�rfattareID) references F�rfattare(ID) on delete cascade on update cascade,
----constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);

--create table BokSpr�k(
--Spr�kID int primary key,
--Spr�k nvarchar(max) not null
--);



--insert into BokSpr�k
--values
--(1,'Svenska'),
--(2,'Engelska');


--create table B�ckerGenreJunction(
--ISBN13 nvarchar(13) constraint FK_ISBN13 foreign key (ISBN13) references B�cker(ISBN13),
--GenreID int not null constraint FK_GenreID foreign key (GenreID) references Genre(GenreID));



--create table Genre(
--GenreID int IDENTITY(1,1) primary key,
--Genre nvarchar(max) not null);


--insert into Genre
--values
--('Thriller'),
--('Deckare'),
--('Kriminalroman'),
--('Kokbok'),
--('Sk�nlitteratur'),
--('Romantik'),
--('F�r�ldraskap'),
--('Uppfostran');


--create table LagerSaldo(
--ButikID int not null,
--ISBN13 nvarchar(13) not null,
--Antal int not null,
--FormID int not null
----constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID) on delete cascade on update cascade,
----constraint FK_ISBN foreign key (ISBN13) references B�cker(ISBN13) on delete cascade on update cascade,
--Primary Key (ButikID,ISBN13)
--);


--create table F�rlag(
--ISBN13 nvarchar(13) not null,
--F�rlagsNamn nvarchar(max) not null,
--Primary Key (ISBN13),
----foreign key (ISBN13) references B�cker(ISBN13) on delete cascade on update cascade
--); 

--insert into F�rlag
--values
--('9789174130416','Bonnier Audio'),
--('9780099537090','Random House UK'),
--('9789175035505','M�npocket'),
--('9789127179554','Natur Kultur Allm�nlitteratur'),
--('9789113122151','Norstedts'),
--('9789100167127','Albert Bonniers F�rlag'),
--('9789137158686','Bokf�rlaget Forum'),
--('9781398518179','SimonSchuster Ltd'),
--('9781612680194','Plata Publiching'),
--('9789137152653','Bokf�rlaget Forum'),
--('9789113111261','Norstedts');


--create table Ordrar(
--OrderID int identity(1,1) primary key,
--ISBN13 nvarchar(13) not null,
--Antal int not null,
--StyckPris int not null,
--OrderTid datetime2 not null,
--ButikID int not null,
--PersonalID int not null);

--Bulk insert Ordrar
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\Ordrar.csv'
--WITH
--(
--        --FORMAT='CSV',
--        DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);



--Bulk insert B�cker
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\B�cker_utan_f�rf_Genre.csv'
--WITH
--(
--        --FORMAT='CSV',
--        DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);


--Bulk insert LagerSaldo
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\LagerSaldo.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);



--Bulk insert F�rfattare
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\F�rfattare.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);


--Bulk insert GenreFakta
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\GenreFakta.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);



--Bulk insert B�ckerF�rfattareJunction
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\B�cker_f�rf_junction.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);


--Bulk insert B�ckerGenreJunction
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\B�cker_Genre_junction.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);



--select 
--ISBN13,
--sum(Styckpris) as sales
--from Ordrar
--Group by ISBN13
--order by  sales desc;


select * from Bokform
select * from Anst�llningsform
select * from F�rfattare
select * from F�rlag
select * from Butiker
select * from B�cker
select * from Genre
select * from LagerSaldo
select * from Ordrar
select * from Personal
select * from B�ckerF�rfattareJunction
select * from B�ckerGenreJunction


--Genre
--select
--t1.ISBN13,
--t1.Titel,
--t3.Genre
--from B�cker t1
--join B�ckerGenreJunction t2
--on t1.ISBN13=t2.ISBN13

--join Genre t3
--on t2.GenreID=t3.GenreID

----F�rfattare
--select
--t1.ISBN13,
--t1.Titel,
--t3.F�rnamn,
--t3.Efternamn
--from B�cker t1
--join B�ckerF�rfattareJunction t2
--on t1.ISBN13=t2.ISBN13

--join F�rfattare t3
--on t2.F�rfattareID=t3.ID







--alter table Ordrar
--add constraint FK_B�cker foreign key (ISBN13) references B�cker(ISBN13)

--alter table LagerSaldo
--add foreign key (ButikID) references Butiker(ButikID)

--alter table LagerSaldo
--add foreign key (ISBN13) references B�cker(ISBN13)
--add foreign key (FormID) references Bokform (FormID)

--alter table F�rfattare
--add foreign key (ID) references (GenreID)

--alter table B�cker
--add foreign key (GenreID) references Genre(GenreID)

--alter table B�cker
--add foreign key (Spr�kID) references BokSpr�k(Spr�kID)

--alter table B�cker
--add foreign key (FormID) references Bokform(FormID)

--alter table B�cker
--add constraint FK_F�rlag foreign key (ISBN13) references F�rlag(ISBN13)

--alter table B�cker
--add CHECK (Len(ISBN13)=13)

--alter table B�ckerF�rfattareJunction
--add CHECK (Len(ISBN13)=13)

--alter table B�ckerGenreJunction
--add CHECK (Len(ISBN13)=13)

--alter table F�rlag
--add CHECK (Len(ISBN13)=13)

--alter table LagerSaldo
--add CHECK (Len(ISBN13)=13)

--alter table Ordrar
--add CHECK (Len(ISBN13)=13)

--alter table B�cker
--drop constraint FK__B�cker__F�rfatta__6DCC4D03


--alter table B�cker
--add primary key(ISBN13,F�rfattarID)
--add constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade;

--Alter table Personal
--add constraint FK_Anst�llning foreign key (ButikID) references Butiker(ButikID); --on delete cascade on update cascade;

--alter table personal
--add constraint FK_Anst�llningsform foreign key (AFormID) references Anst�llningsform(AFormID);

--alter table Butiker
--add constraint FK_Butikschef foreign key (Butikschef) references Personal(PersonalID) on delete cascade on update cascade;

--Alter table Ordrar
--add foreign key (PersonalID) references Personal(PersonalID);

--Alter table Ordrar
--add foreign key (ButikID) references Butiker(ButikID);