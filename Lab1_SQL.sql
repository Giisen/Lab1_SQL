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
--Antst�llningsform nvarchar(max)
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
--('Torslanda','Flygv�gen 1','42341','Torslanda',1),
--('�sa','Strandv�gen 12','41719','�sa',4),
--('Stockholm','Paradgatan 8','51317','Stockholm',8)
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
--('Olof','Nilsson',1,'20000201','99991231',3);



--create table F�rfattare(
--ID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--F�delsedatum date not null,
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


--create table B�cker(
--ISBN13 nvarchar(32) primary key,
--Titel nvarchar(max) not null,
--Spr�k nvarchar(max) not null,
--Pris int not null,
--Utgivningsdatum date not null,
--F�rfattareID int not null,
--FormID int not null,
--AntalSidor int,
--Genre nvarchar(max),
--constraint FK_F�rfattareID foreign key (F�rfattareID) references F�rfattare(ID) on delete cascade on update cascade,
----constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);



--create table LagerSaldo(
--ButikID int not null,
--ISBN13 nvarchar(32) not null,
--Antal int not null,
--FormID int not null
--constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID) on delete cascade on update cascade,
--constraint FK_ISBN foreign key (ISBN13) references B�cker(ISBN13) on delete cascade on update cascade,
--Primary Key (ButikID,ISBN13)
--);

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
--(3,'9789175035505',7,2);


--create table F�rlag(
--ISBN13 nvarchar(32) not null,
--F�rlagsNamn nvarchar not null,
--Primary Key (ISBN13),
--foreign key (ISBN13) references B�cker(ISBN13) on delete cascade on update cascade
--); 



--insert into F�rfattare(F�rnamn,Efternamn,F�delsedatum)
--Values
--('Brown', 'Dan','19640622'),
--('Grishamn', 'John','19550208'),
--('Sten', 'Viveca','19590618');



--insert into B�cker (ISBN13,Titel,Spr�k,Pris,Utgivningsdatum,F�rfattareID,FormID,AntalSidor,Genre)
--values
--('9789174130416','Da Vinci-koden','Svenska',150,'20091001',1,3,0,'Thriller'),
--('9780099537090','The Firm','Engelska',99,'20101028',1,2,496,'Thriller'),
--('9789175035505','I farans riktning','Svenska',69,'20160616',2,3,186,'Roman');




select * from B�cker;
select * from F�rfattare;
select * from Butiker;
select * from Bokform;






--alter table B�cker
--add constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade;

--Alter table Personal
--add constraint FK_Anst�llning foreign key (ButikID) references Butiker(ButikID); --on delete cascade on update cascade;

--alter table personal
--add constraint FK_Anst�llningsform foreign key (AFormID) references Anst�llningsform(AFormID);

--alter table Butiker
--add constraint FK_Butikschef foreign key (Butikschef) references Personal(PersonalID) on delete cascade on update cascade;