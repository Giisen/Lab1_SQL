--create database Bokhandel;
use Bokhandel;

--create table F�rfattare(
--ID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar not null,
--Efternamn nvarchar not null,
--F�delsedatum date not null,
--);

--create table Bokform(
--FormID int IDENTITY(1,1) primary key,
--FormNamn nvarchar not null
--);
 

--create table B�cker(
--ISBN13 int primary key,
--Titel nvarchar not null,
--Spr�k nvarchar not null,
--Pris int not null,
--Utgivningsdatum date not null,
--F�rfattareID int not null,
--FormID int not null,
--constraint FK_F�rfattareID foreign key (F�rfattareID) references F�rfattare(ID),
--constraint FK_Form foreign key (FormID) references Bokform(FormID)
--);

--create table Personal(
--PersonalID int IDENTITY(1,1) primary key,
--F�rnamn nvarchar not null,
--Efternamn nvarchar not null,
--Anst�llningstyp int not null,
--A_From date not null,
--A_Tom date not null,
--ButikID int);



--create table Butiker(
--ButikID int IDENTITY(1,1) primary key,
--ButiksNamn nvarchar not null,
--Gatuadress nvarchar not null,
--Postnummer nvarchar not null,
--Postort nvarchar not null,
--Butikschef int not null
--constraint FK_Butikschef foreign key (Butikschef) references Personal(PersonalID)
--);

--Alter table Personal
--add constraint FK_Anst�llning foreign key (ButikID) references Butiker(ButikID);


--create table LagerSaldo(
--ButikID int not null,
--ISBN int not null,
--Antal int not null,
--FormID int not null
--constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID),
--constraint FK_ISBN foreign key (ISBN) references B�cker(ISBN13),
--Primary Key (ButikID,ISBN)
--);



--create table F�rlag(
--ISBN13 int not null,
--F�rlagsNamn nvarchar not null,
--Primary Key (ISBN13),
--foreign key (ISBN13) references B�cker(ISBN13) 
--); 


--�ndringar gjorda efter skapade tabeller:

--Alter table B�cker
--add AntalSidor int;





