--create database Bokhandel;
use Bokhandel;


--create table Personal(
--PersonalID int IDENTITY(1,1) primary key,
--Förnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--AFormID int not null,
--A_From date not null,
--A_Tom date not null,
--ButikID int);


--create table Anställningsform
--(AFormID int IDENTITY(1,1) primary key,
--Anställningsform nvarchar(max)
--);


--insert into Anställningsform
--(Anställningsform)
--Values
--('Tillsvidare'),
--('Timanställd');

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
--('Läshörnan','Flygvägen 1','42341','Torslanda',1),
--('Book on the beach','Strandvägen 12','41719','Åsa',4),
--('City Book','Paradgatan 8','51317','Stockholm',8),
--('Web','Lagervägen 3','13241','Flen',9)
--;


--insert into Personal
--(Förnamn,Efternamn,AFormID,A_From,A_Tom,ButikID)
--Values
--('Krister','Ekelund',1,'19990101','99991231',1),
--('Niklas','Hjelm',2,'20220401','20220930',2),
--('Tova','Larsson',2,'20050601','99991231',3),
--('Eva','Ek',1,'20090701','99991231',2),
--('Björn','Lindström',1,'20100301','99991231',3),
--('Linda','Ström',2,'20140601','20220301',3),
--('Karin','Örn',1,'20170801','99991231',1),
--('Olof','Nilsson',1,'20000201','99991231',3)
--('Conny','Svensson',1,'20050601','99991231',4);


--create table Författare(
--ID int IDENTITY(1,1) primary key,
--Efternamn nvarchar(max) not null,
--Förnamn nvarchar(max) not null,
--Födelsedatum date not null,
--);

--create table BöckerFörfattareJunction(
--ISBN13 nvarchar(13) foreign key (ISBN13) references Böcker(ISBN13),
--FörfattareID int not null foreign key (FörfattareID) references Författare(ID));

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



--create table Böcker(
----BokID int identity(1,1) Primary key,
--ISBN13 nvarchar(13) Primary key,
--Titel nvarchar(max) not null,
--SpråkID int not null,
--Pris int not null,
--Utgivningsdatum date not null,
----FörfattarID int not null,
--FormID int not null,
--AntalSidor int,
----GenreID int
----constraint FK_FörfattareID foreign key (FörfattareID) references Författare(ID) on delete cascade on update cascade,
----constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);

--create table BokSpråk(
--SpråkID int primary key,
--Språk nvarchar(max) not null
--);



--insert into BokSpråk
--values
--(1,'Svenska'),
--(2,'Engelska');


--create table BöckerGenreJunction(
--ISBN13 nvarchar(13) constraint FK_ISBN13 foreign key (ISBN13) references Böcker(ISBN13),
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
--('Skönlitteratur'),
--('Romantik'),
--('Föräldraskap'),
--('Uppfostran');


--create table LagerSaldo(
--ButikID int not null,
--ISBN13 nvarchar(13) not null,
--Antal int not null,
--FormID int not null
----constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID) on delete cascade on update cascade,
----constraint FK_ISBN foreign key (ISBN13) references Böcker(ISBN13) on delete cascade on update cascade,
--Primary Key (ButikID,ISBN13)
--);


--create table Förlag(
--ISBN13 nvarchar(13) not null,
--FörlagsNamn nvarchar(max) not null,
--Primary Key (ISBN13),
----foreign key (ISBN13) references Böcker(ISBN13) on delete cascade on update cascade
--); 

--insert into Förlag
--values
--('9789174130416','Bonnier Audio'),
--('9780099537090','Random House UK'),
--('9789175035505','Månpocket'),
--('9789127179554','Natur Kultur Allmänlitteratur'),
--('9789113122151','Norstedts'),
--('9789100167127','Albert Bonniers Förlag'),
--('9789137158686','Bokförlaget Forum'),
--('9781398518179','SimonSchuster Ltd'),
--('9781612680194','Plata Publiching'),
--('9789137152653','Bokförlaget Forum'),
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



--Bulk insert Böcker
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\Böcker_utan_förf_Genre.csv'
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



--Bulk insert Författare
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\Författare.csv'
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



--Bulk insert BöckerFörfattareJunction
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\Böcker_förf_junction.csv'
--WITH
--(
--        FORMAT='CSV',
--        --DATAFILETYPE='char',
--		FIRSTROW=2,
--		FIELDTERMINATOR = ',',
--		ROWTERMINATOR = '\n'
--);


--Bulk insert BöckerGenreJunction
--from 'C:\Users\krist\Documents\GitHub\Lab1 SQL\Lab1_SQL\Böcker_Genre_junction.csv'
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
select * from Anställningsform
select * from Författare
select * from Förlag
select * from Butiker
select * from Böcker
select * from Genre
select * from LagerSaldo
select * from Ordrar
select * from Personal
select * from BöckerFörfattareJunction
select * from BöckerGenreJunction


--Genre
--select
--t1.ISBN13,
--t1.Titel,
--t3.Genre
--from Böcker t1
--join BöckerGenreJunction t2
--on t1.ISBN13=t2.ISBN13

--join Genre t3
--on t2.GenreID=t3.GenreID

----Författare
--select
--t1.ISBN13,
--t1.Titel,
--t3.Förnamn,
--t3.Efternamn
--from Böcker t1
--join BöckerFörfattareJunction t2
--on t1.ISBN13=t2.ISBN13

--join Författare t3
--on t2.FörfattareID=t3.ID







--alter table Ordrar
--add constraint FK_Böcker foreign key (ISBN13) references Böcker(ISBN13)

--alter table LagerSaldo
--add foreign key (ButikID) references Butiker(ButikID)

--alter table LagerSaldo
--add foreign key (ISBN13) references Böcker(ISBN13)
--add foreign key (FormID) references Bokform (FormID)

--alter table Författare
--add foreign key (ID) references (GenreID)

--alter table Böcker
--add foreign key (GenreID) references Genre(GenreID)

--alter table Böcker
--add foreign key (SpråkID) references BokSpråk(SpråkID)

--alter table Böcker
--add foreign key (FormID) references Bokform(FormID)

--alter table Böcker
--add constraint FK_Förlag foreign key (ISBN13) references Förlag(ISBN13)

--alter table Böcker
--add CHECK (Len(ISBN13)=13)

--alter table BöckerFörfattareJunction
--add CHECK (Len(ISBN13)=13)

--alter table BöckerGenreJunction
--add CHECK (Len(ISBN13)=13)

--alter table Förlag
--add CHECK (Len(ISBN13)=13)

--alter table LagerSaldo
--add CHECK (Len(ISBN13)=13)

--alter table Ordrar
--add CHECK (Len(ISBN13)=13)

--alter table Böcker
--drop constraint FK__Böcker__Författa__6DCC4D03


--alter table Böcker
--add primary key(ISBN13,FörfattarID)
--add constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade;

--Alter table Personal
--add constraint FK_Anställning foreign key (ButikID) references Butiker(ButikID); --on delete cascade on update cascade;

--alter table personal
--add constraint FK_Anställningsform foreign key (AFormID) references Anställningsform(AFormID);

--alter table Butiker
--add constraint FK_Butikschef foreign key (Butikschef) references Personal(PersonalID) on delete cascade on update cascade;

--Alter table Ordrar
--add foreign key (PersonalID) references Personal(PersonalID);

--Alter table Ordrar
--add foreign key (ButikID) references Butiker(ButikID);