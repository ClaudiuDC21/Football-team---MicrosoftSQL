CREATE DATABASE [Echipa de fotbal] ;
GO
USE [Echipa de fotbal] ;

DROP TABLE [Echipa fotbal];

CREATE TABLE [Echipa fotbal](
[ID-ul echipei] int primary key,
[Numele echipei] varchar(50),
[Anul infiintari] int,
[Oras de provenienta] varchar(50),
[Marimea lotului] int
);

DROP TABLE Jucator;

CREATE TABLE Jucator(
[ID-ul jucatorului] int primary key,
[Numele jucatorului] varchar(50),
[Numarul de pe tricou] int,
[Varsta jucatorului] int,
[Picior preferat] varchar(50),
[Inaltime jucator] float,
[ID-ul echipei de care apartine] int foreign key references [Echipa fotbal]([ID-ul echipei]) on update cascade on delete SET NULL
);

DROP TABLE [Ghete de joc];

CREATE TABLE [Ghete de joc](
[ID-ul ghetelor] int primary key,
[Marimea ghetelor] int,
[Firma ghetelor] varchar(50),
[ID-ul jucatorului ce detine ghetele] int foreign key references Jucator([ID-ul jucatorului]) on update cascade on delete SET NULL
);

DROP TABLE Competitie;

CREATE TABLE Competitie(
[ID-ul competitiei] int primary key,
[Numele competitiei] varchar(50),
[Numar participanti] int,
[Premii totale acordate (in M $)] float,
[Durata competitie (in luni)] float
);

DROP TABLE Clasament;

CREATE TABLE Clasament(
Pozitie int,
[Numar etape disputate] int,
[ID-ul echipei participante] int foreign key references [Echipa fotbal]([ID-ul echipei]) on update cascade on delete cascade,
[ID-ul competitiei] int foreign key references Competitie([ID-ul competitiei]) on update cascade on delete cascade,
constraint PK_clasament primary key ([ID-ul echipei participante],[ID-ul competitiei])
);

DROP TABLE Antrenor;

CREATE TABLE Antrenor(
[ID-ul antrenorului] int primary key,
[Numele antrenorului] varchar(50),
[Varsta antrenorului] int, 
[Numar echipe antrenate] int,
[Stil preferat] varchar(50)
);

DROP TABLE [Contract intre echipa si antrenor];

CREATE TABLE [Contract intre echipa si antrenor](
[Durata contract (in luni)] float,
[ID-ul antrenorului] int foreign key references Antrenor([ID-ul antrenorului]) on update cascade on delete cascade,
[ID-ul echipei] int foreign key references [Echipa fotbal]([ID-ul echipei]) on update cascade on delete cascade,
constraint PK_contract primary key([ID-ul antrenorului],[ID-ul echipei])
);

INSERT INTO [Echipa fotbal]([ID-ul echipei],[Numele echipei],[Anul infiintari],[Oras de provenienta],[Marimea lotului]) VALUES
(1, 'Universitatea Cluj', 1919, 'Cluj', 23),
(2, 'FC Steaua Bucuresti', 1947, 'Bucuresti', 24),
(3, 'ACS Foresta Suceava', 2012, 'Suceava', 20),
(4, 'FC Barcelona', 1899, 'Barcelona', 26),
(5, 'FC Liverpool', 1892, 'Liverpool', 24),
(6, 'Borussia Dortmund', 1909, 'Dortmund', 23),
(7, 'AC Milan', 1899, 'Milano', 25)
;

INSERT INTO Jucator([ID-ul jucatorului], [Numele jucatorului], [Numarul de pe tricou], [Varsta jucatorului], [Picior preferat], [Inaltime jucator], [ID-ul echipei de care apartine]) VALUES
(21, 'Romario Pires', 52, 31, 'dreptul', 1.85, 1),
(22, 'Darius Olaru', 27, 24, 'dreptul', 1.76, 2),
(23, 'Toma Niga', 1, 29, 'dreptul', 1.80, 3),
(24, 'Ely Fernandes', 18, 31, 'stangul', 1.74, 1),
(25, 'Frenkie de Jong', 6, 26, 'ambele', 1.78, 4),
(26, 'Mohamed Salah', 10, 30, 'stangul', 1.70, 5),
(27, 'Marco Reus', 10, 33, 'ambele', 1.75, 6),
(28, 'Dragos Tescan', 98, 23, 'dreptul', 1.83, 1),
(29, 'andrea Compagno', 9, 26, 'dreptul', 1.90, 2);

INSERT INTO [Ghete de joc]([ID-ul ghetelor],[Marimea ghetelor], [Firma ghetelor], [ID-ul jucatorului ce detine ghetele]) VALUES
(41, 43, 'Nike', 21),
(42, 40, 'Nike', 22),
(43, 40, 'Mercurial', 23),
(44, 40, 'Adidas', 23);

INSERT INTO Antrenor([ID-ul antrenorului],[Numele antrenorului], [Varsta antrenorului], [Numar echipe antrenate], [Stil preferat]) VALUES
(61, 'Eugen Neagoe', 55, 8, 'defensiv'),
(62, 'Mihai Pintilii', 41, 0, 'mixat'),
(63, 'Dorin Goian', 46, 3, 'ofensiv'),
(64, 'Xavi Hernandez', 39, 1, 'ofensiv'),
(65, 'Juergen Klopp',50, 5, 'mixat'),
(66, 'Lucien Favre', 48, 10, 'defensiv');

INSERT INTO [Contract intre echipa si antrenor]([Durata contract (in luni)], [ID-ul echipei], [ID-ul antrenorului]) VALUES
(24, 1, 61),(12,2,62),(20, 3, 63), (6, 4, 64), (48,5, 65);

INSERT INTO Competitie([ID-ul competitiei], [Numele competitiei], [Numar participanti], [Premii totale acordate (in M $)], [Durata competitie (in luni)]) VALUES
(81, 'UEFA Champions League', 32, 56.8, 6),
(82, 'UEFA Europa League', 24, 37, 5),
(83, 'UEFA Conference League', 28, 21.9, 7),
(84, 'Superliga', 16, 12, 10),
(85, 'Premier League', 20, 190, 10);

INSERT INTO Clasament(Pozitie, [Numar etape disputate], [ID-ul echipei participante], [ID-ul competitiei]) VALUES
(1, 15, 1, 81),
(2, 13, 5, 81),
(3, 10, 6, 81), 
(1, 20, 3, 84), 
(5, 4, 2, 82), 
(19, 35, 5, 85);

INSERT INTO [Echipa fotbal] VALUES (8, 'FC Dinamo Bucuresti', 1948, 'Bucuresti', 21);


USE [Echipa de fotbal]
SELECT * FROM [Echipa fotbal];
SELECT * FROM Jucator;
SELECT * FROM [Ghete de joc];
SELECT * FROM Antrenor;
SELECT * FROM [Contract intre echipa si antrenor];
SELECT * FROM Competitie;
SELECT * FROM Clasament;

UPDATE [Echipa fotbal]
SET [Numele echipei] = 'Inter Milan',[Anul infiintari] = 1917
WHERE [Oras de provenienta] = 'Milano';

UPDATE Jucator
SET [Numarul de pe tricou] = NULL
WHERE [Numarul de pe tricou] >= 9 and [Numarul de pe tricou] <=20;

UPDATE Competitie
SET [Numar participanti] = 32
WHERE [Numar participanti] = 16 or [Numar participanti] = 8;

DELETE FROM Jucator
WHERE [Numarul de pe tricou] IS NULL;

--Cerinta numarul 1: o interogare cu unul din operatorii UNION, INTERSECT, EXCEPT, la alegere;

SELECT 'Antrenor' AS Tip, [Numele antrenorului] AS 'Nume', [Varsta antrenorului] AS 'Varsta'
From Antrenor
UNION
SELECT 'Jucator' , [Numele jucatorului] AS 'Nume', [Varsta jucatorului] AS 'Varsta'
FROM Jucator
ORDER BY Varsta DESC


-- Cerinta numarul 2: doua interogari cu operatorii INNER JOIN si, la alegere, LEFT JOIN, RIGHT JOIN sau FULL JOIN;
  -- o interogare va extrage date din minim trei tabele aflate in relatie many-to-many;

SELECT Jucator.[Numele jucatorului], Jucator.[Picior preferat], [Ghete de joc].[Marimea ghetelor], [Ghete de joc].[Firma ghetelor]
FROM Jucator
INNER JOIN [Ghete de joc] on Jucator.[ID-ul jucatorului] = [Ghete de joc].[ID-ul jucatorului ce detine ghetele];

SELECT [Echipa fotbal].[Numele echipei], Competitie.[Numele competitiei], Clasament.Pozitie, Competitie.[Numar participanti]
FROM (([Echipa fotbal]
INNER JOIN  Clasament on [Echipa fotbal].[ID-ul echipei] = Clasament.[ID-ul echipei participante])
INNER JOIN Competitie on Competitie.[ID-ul competitiei] = Clasament.[ID-ul competitiei]);


SELECT [Echipa fotbal].[Numele echipei], Jucator.[Numele jucatorului], Antrenor.[Numele antrenorului]
FROM ((([Echipa fotbal]
LEFT JOIN Jucator ON Jucator.[ID-ul echipei de care apartine] = [Echipa fotbal].[ID-ul echipei])
RIGHT JOIN [Contract intre echipa si antrenor] On [Contract intre echipa si antrenor].[ID-ul echipei] =	[Echipa fotbal].[ID-ul echipei])
FULL JOIN Antrenor ON Antrenor.[ID-ul antrenorului] = [Contract intre echipa si antrenor].[ID-ul antrenorului]);


-- Cerinta numarul 3: trei interogari cu clauza GROUP BY; una dintre acestea va contine clauza HAVING; se vor folosi
  -- cel putin trei operatori de agregare dintre: COUNT, SUM, AVG, MIN, MAX.

SELECT [Echipa fotbal].[Numele echipei], AVG(CAST(Jucator.[Varsta jucatorului] AS FLOAT)) as 'Medie de varsta'
FROM [Echipa fotbal]
RIGHT JOIN Jucator ON Jucator.[ID-ul echipei de care apartine] = [Echipa fotbal].[ID-ul echipei]
GROUP BY [Numele echipei];

SELECT Jucator.[Numele jucatorului], COUNT([Ghete de joc].[ID-ul ghetelor]) AS 'Numarul de ghete pe care jucatorul le detine'
FROM Jucator
INNER JOIN [Ghete de joc] ON [Ghete de joc].[ID-ul jucatorului ce detine ghetele] = Jucator.[ID-ul jucatorului]
GROUP BY [Numele jucatorului]

SELECT [Echipa fotbal].[Numele echipei], MIN(Jucator.[Varsta jucatorului]) AS 'Cel mai tanar jucator inregistrat', MAX(Jucator.[Varsta jucatorului])AS 'Cel mai batran jucator inregistrat'
FROM [Echipa fotbal]
INNER JOIN Jucator ON Jucator.[ID-ul echipei de care apartine] = [Echipa fotbal].[ID-ul echipei]
WHERE ([Echipa fotbal].[Anul infiintari] < 1960 AND ([Echipa fotbal].[Marimea lotului] NOT LIKE '1%' or [Echipa fotbal].[Marimea lotului] NOT LIKE '%1'))
GROUP BY [Echipa fotbal].[Numele echipei]
HAVING MIN(Jucator.[Varsta jucatorului]) < 32; 

-- Cerinta numarul 4: doua interogari imbricate – se vor folosi operatorii IN si EXISTS (interogare SELECT in clauza WHERE);

SELECT [Echipa fotbal].[Numele echipei] as 'Echipele care evolueaza in cel putin o competitie', [Echipa fotbal].[ID-ul echipei]
FROM [Echipa fotbal]
WHERE EXISTS(SELECT Clasament.Pozitie FROM Clasament WHERE Clasament.[ID-ul echipei participante] =  [Echipa fotbal].[ID-ul echipei] GROUP BY Clasament.Pozitie HAVING COUNT(Clasament.[ID-ul echipei participante]) >= 1);

SELECT DISTINCT [Echipa fotbal].[Oras de provenienta], [Echipa fotbal].[Numele echipei]
FROM [Echipa fotbal]
WHERE [Echipa fotbal].[Oras de provenienta] NOT IN ('Cluj', 'Suceava');

SELECT * 
FROM Antrenor
WHERE Antrenor.[Stil preferat] IN 
(SELECT (Antrenor.[Stil preferat]) FROM Antrenor WHERE Antrenor.[Stil preferat] = 'ofensiv');

--Laborator 4

--cerinta nr. 1: scrieti cate o procedura stocata care introduce date intr-un tabel, pentru cel putin trei tabele,
 --inclusiv un tabel cu o cheie primara compusa;

DROP PROCEDURE [Doar litere]

CREATE OR ALTER PROCEDURE [Genereaza un id jucatorului]
AS
BEGIN
DECLARE @generator int
SET @generator = 0
SELECT @generator = COUNT(*) FROM Jucator
IF @generator = 0
	return 1
else return @generator + 1
end



CREATE or ALTER FUNCTION validare_varsta(@varsta int)
returns int as
begin
declare @valoare int
if @varsta < 1
	return 0
return 1
end

CREATE OR ALTER FUNCTION validare_cuvinte(@cuvinte varchar(50))
returns int as
begin
declare @valoare int
IF @cuvinte not like '%[^% %a-zA-z]%'
		return 1
 return 0
end

CREATE or ALTER FUNCTION validare_valori_pozitive(@valoare int)
returns int as
begin
declare @return_value int
if @valoare < 0 or @valoare is null
	return 0
return 1
end

DROP PROCEDURE [Introduce jucator] 

CREATE OR ALTER PROCEDURE [Introduce jucator] (@nume varchar(50),@numar int,@varsta int,@picior varchar(50),@inaltime float,@id_echipa int)
AS
BEGIN
declare @numara_probleme int
set @numara_probleme = 0
DECLARE @id int
EXEC @id = [Genereaza un id jucatorului]
if dbo.validare_cuvinte(@nume) = 0
begin
	RAISERROR('Numele jucatorului trebuie sa contina doar litere',7,10)
	set @numara_probleme = 1
end
if dbo.validare_cuvinte(@picior) = 0
begin
	Raiserror('Piciorul preferat al jucatorului trebuie sa contina doar litere',7,10)
	set @numara_probleme = 1
end
if dbo.validare_varsta(@varsta) = 0
BEGIN
	RAISERROR('Varsta trebuie sa fie valida',7,10)
	set @numara_probleme = 1
END
if @id_echipa is null 
	throw 51000, 'ID-ul echipei nu poate fi null!',1
declare @index int
set @index = 0
select @index = count(*) from [Echipa fotbal]
where[ID-ul echipei] = @id_echipa
if @index = 0
	throw 51000, 'Echipa cu acest id nu exista',1
if @numara_probleme = 0
	insert into Jucator values(@id, @nume, @numar, @varsta ,@picior ,@inaltime ,@id_echipa)
	else RAISERROR('Nu se poate adauga un jucator din cauza unor valori gresite',7,10)
END

SELECT * FROM [Echipa fotbal]
SELECT * FROM [Jucator]
DELETE FROM Jucator
WHERE [ID-ul jucatorului] in (10,11,12,13)

exec [Introduce jucator] 'Lionel Messi', 10, 33,'stangul', 1.71, 1
exec [Introduce jucator] 'Kylian Mbappe', 10, 24,'dreptul', 1.78, 1
exec [Introduce jucator] 'CR7', 7, 37,'ambele', 1.85, 2
exec [Introduce jucator] 'Cristiano Ronaldo', 7, 37,'d1 si s2', 1.85, 2
exec [Introduce jucator] 'Cristiano Ronaldo', null, null,'ambele', null, null
exec [Introduce jucator] 'Cristiano Ronaldo', null, 37,'ambele', null, null
exec [Introduce jucator] 'Cristiano Ronaldo', 7, 0,'ambele', 1.85, 2

CREATE OR ALTER PROCEDURE [Genereaza un id antrenorului]
AS
BEGIN
DECLARE @generator int
SET @generator = 0
SELECT @generator = COUNT(*) FROM Antrenor
IF @generator = 0
	return 1
else return @generator + 1
end

DROP PROCEDURE [Introduce antrenor] 

CREATE OR ALTER PROCEDURE [Introduce antrenor] (@nume varchar(50),@varsta int,@echipe_antrenate int ,@stil varchar(50))
AS
BEGIN
declare @numara_probleme int
set @numara_probleme = 0
DECLARE @id int
EXEC @id = [Genereaza un id antrenorului]
if dbo.validare_cuvinte(@nume) = 0
begin
	RAISERROR('Numele antrenorului trebuie sa contina doar litere',7,10)
	set @numara_probleme = 1
end
if dbo.validare_cuvinte(@stil) = 0
begin
	RAISERROR('stilul preferat al antrenorului trebuie sa contina doar litere',7,10)
	set @numara_probleme = 1
end
if dbo.validare_varsta(@varsta) = 0
BEGIN
	RAISERROR('Varsta trebuie sa fie valida',7,10)
	set @numara_probleme = 1
END
if dbo.validare_valori_pozitive(@echipe_antrenate) = 0
BEGIN
	RAISERROR('Numarul de echipe antrenate trebuie sa fie pozitiv',7,10)
	set @numara_probleme = 1
END
if @numara_probleme = 0
	insert into Antrenor values(@id, @nume,  @varsta ,@echipe_antrenate, @stil)
	else RAISERROR('Nu se poate adauga un antrenor din cauza unor valori gresite',7,10)
END

exec [Introduce antrenor] 'Laurentiu Reghecampf',55, null, 'ofensiv'
exec [Introduce antrenor] 'Mihai Alexandru',88, 41, 'defensiv'
exec [Introduce antrenor] 'Mihai2',55, 4, 'ofensiv'
exec [Introduce antrenor] 'Laurentiu Reghecampf',55, 4, '0fensiv'
exec [Introduce antrenor] 'Laurentiu Reghecampf',null, 4, 'ofensiv'

SELECT * FROM Antrenor

create or alter procedure [Introduce un contract intre echipa si antrenor] (@contract float, @id_antrenor int, @id_echipa int)
as
begin
declare @numara_probleme int
set @numara_probleme = 0
declare @i int
set @i = 0
declare @j int
set @j = 0
select @i = count(*) from [Echipa fotbal]
where [Echipa fotbal].[ID-ul echipei] = @id_echipa
if @i = 0
	throw 51000,'Echipa cu id-ul dat nu a putut fi gasita in baza de date!',1
set @i = 0
select @i = count(*) from Antrenor
where Antrenor.[ID-ul antrenorului] = @id_antrenor
if @i = 0
	throw 51000,'Antrenorul cu id-ul dat nu a putut fi gasit in baza de date!',1
set @i = 0
select @i = count(*) from [Contract intre echipa si antrenor]
	where [Contract intre echipa si antrenor].[ID-ul echipei] = @id_echipa
	AND [Contract intre echipa si antrenor].[ID-ul antrenorului] = @id_antrenor
if @i !=0 
	throw 51000, 'Exista deja un contract intre acest antrenor si aceasta echipa!',1
if dbo.validare_valori_pozitive(@contract) = 0
BEGIN
	RAISERROR('Contractul trebuie sa fie un numar pozitiv',7,10)
	set @numara_probleme = 1
END 

if @numara_probleme = 0
	insert into [Contract intre echipa si antrenor] values (@contract, @id_antrenor, @id_echipa)
else RAISERROR('Nu se poate adauga un contract intre antrenor si echipa din cauza unor valori gresite',7,10)
end

SELECT * FROM Antrenor
SELECT * FROM [Echipa fotbal]
SELECT * FROM [Contract intre echipa si antrenor]
 
exec [Introduce un contract intre echipa si antrenor] 24,61,2
exec [Introduce un contract intre echipa si antrenor] -43,64,1
exec [Introduce un contract intre echipa si antrenor] 11.5 ,64,5
exec [Introduce un contract intre echipa si antrenor] 3,55,3
exec [Introduce un contract intre echipa si antrenor] 9,61,99

-- cerinta nr. 2: creati un view care combina date care provin din doua sau trei tabele; 
CREATE VIEW [Echipa si jucatori inregistrati] 
AS SELECT [Echipa fotbal].[Numele echipei], Jucator.[Numele jucatorului]
FROM [Echipa fotbal], Jucator
WHERE Jucator.[ID-ul echipei de care apartine] = [Echipa fotbal].[ID-ul echipei]  

SELECT * FROM [Echipa si jucatori inregistrati]

--cerinta nr. 3:implementati, pentru un tabel la alegere, un trigger pentru operatia de adaugare si unul pentru
 --cea de stergere; la executia fiecarui trigger se va afisa pe ecran un mesaj cu data si ora la care
 --s-a realizat operatia, tipul operatiei (Insert/Delete) si numele tabelului; optional, puteti crea
 --triggere similare si pe alte tabele.



create or alter trigger [Trigger introduce echipa] on [Echipa fotbal] instead of insert
as
begin
declare @id int
declare @nume varchar(50)
declare @an_infiintare int
declare @oras varchar(50)
declare @marime int
select @id = [ID-ul echipei], @nume = [Numele echipei], @an_infiintare = [Anul infiintari], @oras = [Oras de provenienta], @marime=[Marimea lotului] from inserted
if @id is null
	declare @generator int
	select @generator = count(*) from [Echipa fotbal]
	set @id = @generator + 1
if @marime is null
	set @marime = 1
if LEN(@oras) = 0 
	throw 51000,'Echipa trebuie sa aibe neaparat un oras de provenienta!',1
if @nume is null
	throw 51000,'Echipa trebuie sa aibe neaparat un nume!',1
if @an_infiintare is null or @an_infiintare < 0
	throw 51000,'Echipa trebuie sa aibe neaparat un an de infiintare valid!',1
print 'Inserare'
print 'Echipa de fotbal'
print GETDATE()
insert into [Echipa fotbal] values (@id, @nume, @an_infiintare, @oras, @marime)
end 

INSERT INTO [Echipa fotbal] values (null,'Steaua',1947,'Bucuresti',null)

Select * from [Echipa fotbal] 

create or alter trigger [Trigger sterge echipa] on [Echipa fotbal] instead of delete
as
begin
DELETE Jucator
FROM Jucator jucator
INNER JOIN Sters sters
ON jucator.[ID-ul echipei de care apartine] = sters.ID
print 'Stergere'
print 'Echipa de fotbal'
print GETDATE()
end

CREATE OR ALTER TRIGGER [Trigger sterge echipa] ON [Echipa fotbal] FOR DELETE
AS
BEGIN
print 'Stergere'
print 'Echipa de fotbal'
print GETDATE()
END

DELETE FROM [Echipa fotbal] where [ID-ul echipei] = 10

SELECT * FROM Jucator
SELECT * FROM [Echipa fotbal]