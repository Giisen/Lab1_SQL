--create database Bokhandel;
use Bokhandel;



--create table F�rfattare(
--ID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--F�delsedatum date not null,
--);

--create table Bokform(
--FormID int IDENTITY(1,1) primary key,
--BokForm nvarchar not null
--);
 

--create table B�cker(
--ISBN13 nvarchar(32) primary key,
--Titel nvarchar(max) not null,
--Spr�k nvarchar(max) not null,
--Pris int not null,
--Utgivningsdatum date not null,
--F�rfattareID int not null,
--FormID int not null,
--AntalSidor int,
--Genre nvarchar,
--constraint FK_F�rfattareID foreign key (F�rfattareID) references F�rfattare(ID) on delete cascade on update cascade,
--constraint FK_FormID foreign key (FormID) references Bokform(FormID) on delete cascade on update cascade
--);


--create table Personal(
--PersonalID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar not null,
--Efternamn nvarchar not null,
--Anst�llningsform int not null,
--A_From date not null,
--A_Tom date not null,
--ButikID int);


--create table Anst�llningsform
--(AFormID int IDENTITY(1,1) primary key,
--Antst�llningsform nvarchar(max)
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
--add constraint FK_Anst�llning foreign key (ButikID) references Butiker(ButikID); --on delete cascade on update cascade;

--alter table personal
--add constraint FK_Anst�llningsform foreign key (AFormID) references Anst�llningsform(AFormID);

insert into Personal
(F�rnamn,Efternamn,Anst�llningstyp,A_From,A_Tom,ButikID)
Values
('Krister','Ekelund','Tillsvidare'






--create table LagerSaldo(
--ButikID int not null,
--ISBN13 nvarchar(32) not null,
--Antal int not null,
--FormID int not null
--constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID) on delete cascade on update cascade,
--constraint FK_ISBN foreign key (ISBN13) references B�cker(ISBN13) on delete cascade on update cascade,
--Primary Key (ButikID,ISBN13)
--);



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
--values(
--'9780099537090','The Firm','Engelska',99,'20101028',2,1,496,'Thriller'),
--('9789175035505','I farans riktning','Svenska',69,'20160616',3,2,186,'Roman');


