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


--create table F�rfattareDim(
--ID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--F�delsedatum date not null,
--);

--create table F�rfattareFakta(
--ISBN13 nvarchar(13),
--F�rfattareID int not null
--primary key (ISBN13,F�rfattareID));



--insert into F�rfattareFakta (ISBN13,F�rfattareID)
--values
--('9789174130416',1),
--('9780099537090',2),
--('9789175035505',3),
--('9789127179554',4),
--('9789113122151',5),
--('9789100167127',6),
--('9789137158686',3),
--('9781398518179',7),
--('9781612680194',8),
--('9789137152653',9);





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

 --drop table B�cker;

--create table B�cker(
--ISBN13 nvarchar(13) primary key,
--Titel nvarchar(max) not null,
--Spr�kID int not null,
--Pris int not null,
--Utgivningsdatum date not null,
--F�rfattareID int not null,
--FormID int not null,
--AntalSidor int,
----Genre nvarchar(max)
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



--create table GenreFakta(
--ISBN13 nvarchar(13) not null,
--GenreID int not null
--primary key (ISBN13,GenreID));

--create table GenreDim(
--GenreID int IDENTITY(1,1) primary key,
--Genre nvarchar(max) not null);


--insert into GenreDim
--values
--('Thriller'),
--('Deckare'),
--('Kriminalroman'),
--('Kokbok'),
--('Sk�nlitteratur'),
--('Romantik'),
--('F�r�ldraskap'),
--('Uppfostran');



--insert into GenreFakta
--values
--('9789174130416',1),
--('9780099537090',2),
--('9780099537090',3),
--('9789175035505',2),
--('9789175035505',3),
--('9789127179554',4),
--('9789113122151',5),
--('9789100167127',1),
--('9789100167127',2),
--('9789137158686',2),
--('9789137158686',3),
--('9781398518179',5),
--('9781398518179',6),
--('9781612680194',7),
--('9781612680194',8),
--('9789137152653',2),
--('9789137152653',3);



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
--('9789113122151','Nordstedts'),
--('9789100167127','Albert Bonniers F�rlag'),
--('9789137158686','Bokf�rlaget Forum'),
--('9781398518179','SimonSchuster Ltd'),
--('9781612680194','Plata Publiching'),
--('9789137152653','Bokf�rlaget Forum');


--insert into F�rfattareDim(F�rnamn,Efternamn,F�delsedatum)
--Values
--('Brown', 'Dan','19640622'),
--('Grishamn', 'John','19550208'),
--('Sten', 'Viveca','19590618'),
--('Ekengren', 'Stefan','19631208'),
--('Ernaux', 'Annie','19401001'),
--('Keppler', 'Lars','19670120'),
--('Hoover', 'Colleen','19791211'),
--('Robert T', 'Kiyosaki','19470408'),
--('L�ckberg', 'Camilla','19740830');



--insert into B�cker (ISBN13,Titel,Spr�kID,Pris,Utgivningsdatum,F�rfattareID,FormID,AntalSidor)
--values
--('9789174130416','Da Vinci-koden',1,150,'20091001',1,3,0),
--('9780099537090','The Firm',2,99,'20101028',1,2,496),
--('9789175035505','I farans riktning',1,69,'20160616',2,3,186),
--('9789127179554','Potatis',1,249,'20220916',4,1,189),
--('9789113122151','Omst�ndigheter',1,199,'20220902',5,1,127),
--('9789100167127','Spindeln',1,99,'20221019',6,4,0),
--('9789137158686','Botg�raren',1,99,'20221004',3,4,0),
--('9781398518179','It starts with us',2,171,'20221018',7,2,336),
--('9781612680194','Rich dad Poor dad',2,122,'20170427',8,2,336),
--('9789137152653','G�kungen',1,219,'20220912',9,1,350);



--insert into LagerSaldo
--(ButikID,ISBN13,Antal, FormID)
--values
--(1,'9780099537090',14,1),
--(1,'9789174130416',9,3),
--(1,'9789175035505',25,2),
--(2,'9780099537090',4,1),
--(2,'9789174130416',19,3),
--(2,'9789175035505',18,2),
--(3,'9780099537090',10,1),
--(3,'9789174130416',2,3),
--(3,'9789175035505',7,2),
--(1,'9789127179554',33,1),
--(1,'9789113122151',6,1),
--(1,'9789100167127',16,4),
--(1,'9789137158686',9,4),
--(1,'9781398518179',23,2),
--(1,'9781612680194',23,2),
--(1,'9789137152653',14,1),
--(2,'9789127179554',9,1),
--(2,'9789113122151',61,1),
--(2,'9789100167127',4,4),
--(2,'9789137158686',22,4),
--(2,'9781398518179',2,2),
--(2,'9781612680194',3,2),
--(2,'9789137152653',0,1),
--(3,'9789127179554',3,1),
--(3,'9789113122151',34,1),
--(3,'9789100167127',1,4),
--(3,'9789137158686',95,4),
--(3,'9781398518179',19,2),
--(3,'9781612680194',19,2),
--(3,'9789137152653',4,1),
--(4,'9789127179554',330,1),
--(4,'9789113122151',341,1),
--(4,'9789100167127',100,4),
--(4,'9789137158686',250,4),
--(4,'9781398518179',136,2),
--(4,'9781612680194',190,2),
--(4,'9789137152653',49,1);


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

--select 
--ISBN13,
--sum(Styckpris) as sales
--from Ordrar
--Group by ISBN13
--order by  sales desc;



select * from Bokform
select * from Anst�llningsform
select * from F�rfattareDim
select * from F�rfattareFakta
select * from F�rlag
select * from Butiker
select * from B�cker
select * from GenreFakta
select * from GenreDim
select * from LagerSaldo
select * from Ordrar
select * from Personal




--alter table B�cker
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