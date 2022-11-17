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
--('Torslanda','Flygvägen 1','42341','Torslanda',1),
--('Åsa','Strandvägen 12','41719','Åsa',4),
--('Stockholm','Paradgatan 8','51317','Stockholm',8),
--('Web','Lagervägen 3','13241','Flen',1)
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
--('Web','N/A',1,'20050601','99991231',4);



--create table Författare(
--ID int IDENTITY(1,1) primary key,
--Förnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--Födelsedatum date not null,
--);

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
--ISBN13 nvarchar(13) primary key,
--Titel nvarchar(max) not null,
--Språk nvarchar(max) not null,
--Pris int not null,
--Utgivningsdatum date not null,
--FörfattareID int not null,
--FormID int not null,
--AntalSidor int,
--Genre nvarchar(max)
----constraint FK_FörfattareID foreign key (FörfattareID) references Författare(ID) on delete cascade on update cascade,
----constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);



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
--FörlagsNamn nvarchar not null,
--Primary Key (ISBN13),
----foreign key (ISBN13) references Böcker(ISBN13) on delete cascade on update cascade
--); 



--insert into Författare(Förnamn,Efternamn,Födelsedatum)
--Values
--('Brown', 'Dan','19640622'),
--('Grishamn', 'John','19550208'),
--('Sten', 'Viveca','19590618'),
--('Ekengren', 'Stefan','19631208'),
--('Ernaux', 'Annie','19401001'),
--('Keppler', 'Lars','19670120'),
--('Hoover', 'Colleen','19791211'),
--('Robert T', 'Kiyosaki','19470408'),
--('Läckberg', 'Camilla','19740830');



--insert into Böcker (ISBN13,Titel,Språk,Pris,Utgivningsdatum,FörfattareID,FormID,AntalSidor,Genre)
--values
--('9789174130416','Da Vinci-koden','Svenska',150,'20091001',1,3,0,'Thriller'),
--('9780099537090','The Firm','Engelska',99,'20101028',1,2,496,'Thriller'),
--('9789175035505','I farans riktning','Svenska',69,'20160616',2,3,186,'Roman'),
--('9789127179554','Potatis','Svenska',249,'20220916',4,1,189,'Kokbok'),
--('9789113122151','Omständigheter','Svenska',199,'20220902',5,1,127,'Roman'),
--('9789100167127','Spindeln','Svenska',99,'20221019',6,4,0,'Deckare'),
--('9789137158686','Botgöraren','Svenska',99,'20221004',3,4,0,'Deckare'),
--('9781398518179','It starts with us','Engelska',171,'20221018',7,2,336,'Roman'),
--('9781612680194','Rich dad Poor dad','Engelska',122,'20170427',8,2,336,'Föräldraskap'),
--('9789137152653','Gökungen','Svenska',219,'20220912',9,1,350,'Deckare');



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








--alter table Böcker
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