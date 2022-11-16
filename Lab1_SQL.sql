--create database Bokhandel;
use Bokhandel;



--create table Författare(
--ID int IDENTITY(1,1) primary key,
--Förnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--Födelsedatum date not null,
--);

--create table Bokform(
--FormID int IDENTITY(1,1) primary key,
--BokForm nvarchar not null
--);
 

--create table Böcker(
--ISBN13 nvarchar(32) primary key,
--Titel nvarchar(max) not null,
--Språk nvarchar(max) not null,
--Pris int not null,
--Utgivningsdatum date not null,
--FörfattareID int not null,
--FormID int not null,
--AntalSidor int,
--Genre nvarchar,
--constraint FK_FörfattareID foreign key (FörfattareID) references Författare(ID) on delete cascade on update cascade,
--constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);


--create table Personal(
--PersonalID int IDENTITY(1,1) primary key,
--Förnamn nvarchar not null,
--Efternamn nvarchar not null,
--Anställningsform int not null,
--A_From date not null,
--A_Tom date not null,
--ButikID int);


--create table Anställningsform
--(AFormID int IDENTITY(1,1) primary key,
--Antställningsform nvarchar(max)
--);


--create table Butiker(
--ButikID int IDENTITY(1,1) primary key,
--ButiksNamn nvarchar not null,
--Gatuadress nvarchar not null,
--Postnummer nvarchar not null,
--Postort nvarchar not null,
--Butikschef int not null
--constraint FK_Butikschef foreign key (Butikschef) references Personal(PersonalID) on delete cascade on update cascade
--);

--Alter table Personal
--add constraint FK_Anställning foreign key (ButikID) references Butiker(ButikID); --on delete cascade on update cascade;

--alter table personal
--add constraint FK_Anställningsform foreign key (AFormID) references Anställningsform(AFormID);

insert into Personal
(Förnamn,Efternamn,Anställningstyp,A_From,A_Tom,ButikID)
Values
('Krister','Ekelund','Tillsvidare'






--create table LagerSaldo(
--ButikID int not null,
--ISBN13 nvarchar(32) not null,
--Antal int not null,
--FormID int not null
--constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID) on delete cascade on update cascade,
--constraint FK_ISBN foreign key (ISBN13) references Böcker(ISBN13) on delete cascade on update cascade,
--Primary Key (ButikID,ISBN13)
--);



--create table Förlag(
--ISBN13 nvarchar(32) not null,
--FörlagsNamn nvarchar not null,
--Primary Key (ISBN13),
--foreign key (ISBN13) references Böcker(ISBN13) on delete cascade on update cascade
--); 



--insert into Författare(Förnamn,Efternamn,Födelsedatum)
--Values
--('Brown', 'Dan','19640622'),
--('Grishamn', 'John','19550208'),
--('Sten', 'Viveca','19590618');

--insert into Böcker (ISBN13,Titel,Språk,Pris,Utgivningsdatum,FörfattareID,FormID,AntalSidor,Genre)
--values(
--'9780099537090','The Firm','Engelska',99,'20101028',2,1,496,'Thriller'),
--('9789175035505','I farans riktning','Svenska',69,'20160616',3,2,186,'Roman');


