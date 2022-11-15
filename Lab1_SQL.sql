create database Bokhandel;
use Bokhandel;

create table Författare(
ID int IDENTITY(1,1) primary key,
Förnamn nvarchar not null,
Efternamn nvarchar not null,
Födelsedatum date not null,
);

create table Bokform(
FormID int IDENTITY(1,1) primary key,
FormNamn nvarchar not null
);
 

create table Böcker(
ISBN13 int primary key,
Titel nvarchar not null,
Språk nvarchar not null,
Pris int not null,
Utgivningsdatum date not null,
FörfattareID int not null,
FormID int not null,
constraint FK_FörfattareID foreign key (FörfattareID) references Författare(ID),
constraint FK_Form foreign key (FormID) references Bokform(FormID)
);

create table Personal(
PersID int IDENTITY(1,1) primary key,
Förnamn nvarchar not null,
Efternamn nvarchar not null,
Anställningstyp int not null,
A_From date not null,
A_Tom date not null,
ButikID int
constraint FK_Anställning foreign key (ButikID) references Butiker(ButikID)
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
constraint FK_ISBN foreign key (ISBN) references Böcker(ISBN13),
Primary Key (ButikID,ISBN)
);


create table Förlag(
ISBN int not null,
FörlagID int not null,
FörlagNamn nvarchar not null,
Primary Key (FörlagID)
--constraint FK_ISBN foreign key (ISBN) references Böcker(ISBN13), --Kan jag använda tidigare skapad constraint?
); --Siffrorna i mitten är förlagsbeteckning, där kan vi hämta data om vilket förlag.




