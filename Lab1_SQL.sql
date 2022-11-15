create database Bokhandel;
use Bokhandel;

create table F�rfattare(
ID int IDENTITY(1,1) primary key,
F�rnamn nvarchar not null,
Efternamn nvarchar not null,
F�delsedatum date not null,
);

create table Bokform(
FormID int IDENTITY(1,1) primary key,
FormNamn nvarchar not null
);
 

create table B�cker(
ISBN13 int primary key,
Titel nvarchar not null,
Spr�k nvarchar not null,
Pris int not null,
Utgivningsdatum date not null,
F�rfattareID int not null,
FormID int not null,
constraint FK_F�rfattareID foreign key (F�rfattareID) references F�rfattare(ID),
constraint FK_Form foreign key (FormID) references Bokform(FormID)
);

create table Personal(
PersID int IDENTITY(1,1) primary key,
F�rnamn nvarchar not null,
Efternamn nvarchar not null,
Anst�llningstyp int not null,
A_From date not null,
A_Tom date not null,
ButikID int
constraint FK_Anst�llning foreign key (ButikID) references Butiker(ButikID)
);


create table Butiker(
ButikID int IDENTITY(1,1) primary key,
ButiksNamn nvarchar not null,
Gatuadress nvarchar not null,
Postnummer nvarchar not null,
Postort nvarchar not null,
Butikschef int not null
constraint FK_Butikschef foreign key (Butikschef) references Personal(PersID)
);



create table LagerSaldo(
ButikID int not null,
ISBN int not null,
Antal int not null,
FormID int not null
constraint FK_ButikID foreign key (ButikID) references Butiker(ButikID),
constraint FK_ISBN foreign key (ISBN) references B�cker(ISBN13),
Primary Key (ButikID,ISBN)
);


create table F�rlag(
ISBN int not null,
F�rlagID int not null,
F�rlagNamn nvarchar not null,
Primary Key (F�rlagID)
--constraint FK_ISBN foreign key (ISBN) references B�cker(ISBN13), --Kan jag anv�nda tidigare skapad constraint?
); --Siffrorna i mitten �r f�rlagsbeteckning, d�r kan vi h�mta data om vilket f�rlag.




