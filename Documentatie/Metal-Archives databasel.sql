-- SQL Ontwikkelopdracht Jorrit --

--Drops --
Drop table tblGenre cascade constraints;
Drop table tblTheme cascade constraints;
Drop table tblUser cascade constraints;
Drop table tblArtist cascade constraints;
Drop table tblNews cascade constraints;
Drop table tblRole cascade constraints;
Drop table tblDiscussion cascade constraints;
Drop table tblBand cascade constraints;
Drop table tblGenreLine cascade constraints;
Drop table tblBandtheme cascade constraints;
Drop table tblLabel cascade constraints;
Drop table tblAlbum cascade constraints;
Drop table tblLineUp cascade constraints;
Drop table tblSong cascade constraints;
Drop table tblLinks cascade constraints;
Drop table tblReview cascade constraints;
Drop table tblPost cascade constraints;
Drop table tblMenu cascade constraints;
Drop table tblPage cascade constraints;

drop sequence GenreIncrement;
drop sequence ThemeIncrement;
drop sequence UserIncrement;
drop sequence ArtistIncrement;
drop sequence NewsIncrement;
drop sequence RoleIncrement;
drop sequence DiscussionIncrement;
drop sequence LabelIncrement;
drop sequence BandIncrement;
drop sequence AlbumIncrement;
drop sequence SongIncrement;
drop sequence LinksIncrement;
drop sequence ReviewIncrement;
drop sequence PostIncrement;
drop sequence PageIncrement;
drop sequence MenuIncrement;

-- Tables --
create table tblGenre(
Genrenr number not null primary key,
GenreName nvarchar2(40) unique
);
create sequence GenreIncrement;

create table tblTheme(
Themenr number not null primary key,
ThemeName nvarchar2(40) unique
);
create sequence ThemeIncrement;

create table tblUser(
Usernr number not null primary key,
Username nvarchar2(20) unique not null,
FullName nvarchar2(20) unique not null,
Gender nvarchar2(6) Check (Gender = 'Male' Or Gender ='Female'),
Age number(2),
Country nvarchar2(20),
Points Number(38),
Rank nvarchar2(10),
CreationDate date,
Pass nvarchar2(20),
Check (Pass <> Username)
);
create sequence UserIncrement;

create table tblArtist(
Artistnr number not null primary key,
Usernr references tblUser(Usernr) not null,
StageName nvarchar2(50),
FullName nvarchar2(50),
Age number(3) check (Age < 110),
BirthDate date,
Origin nvarchar2(20),
Gender nvarchar2(6),
DeathDate date,
DiedOf nvarchar2(2000),
Biography nvarchar2(2000),
Trivia nvarchar2(2000),
CreationDate date
);
create sequence ArtistIncrement;

create table tblNews(
NewsID number not null primary key,
Title nvarchar2(30),
Text nvarchar2(2000),
DateTime date
);
create sequence NewsIncrement;

create table tblRole(
Rolenr number not null primary key,
ArtistRole nvarchar2(20) not null unique
);
create sequence RoleIncrement;

create table tblDiscussion(
Discussionnr number not null primary key,
Usernr REFERENCES tblUser(Usernr) not null,
DiscussionName nvarchar2(50)
);
create sequence DiscussionIncrement;

create table tblLabel(
Labelnr number not null primary key,
Usernr REFERENCES tblUser(Usernr) not null,
LabelName nvarchar2(100),
Adress nvarchar2(100),
Country nvarchar2(40),
PhoneNumber number(15),
Status nvarchar2(20) check(Status = 'Active' OR Status = 'Disbanded'),
FoundingDate date,
Description nvarchar2(2000),
OnlineShopping nvarchar2(3) check(OnlineShopping = 'Yes' OR OnlineShopping = 'No'),
SubLabels nvarchar2(100),
CreationDate date
);
create sequence LabelIncrement;

create table tblBand(
Bandnr number not null primary key,
Labelnr REFERENCES tblLabel(Labelnr) not null,
Usernr REFERENCES tblUser(Usernr) not null,
BandName nvarchar2(30) unique,
Origin nvarchar2(30),
Place nvarchar2(20),
Status nvarchar2(20) check(Status = 'Active' OR Status = 'Disbanded'),
Formed date,
YearsActive nvarchar2(20),
Description nvarchar2(2000),
CreationDate date,
Logo nvarchar2(255)
);
create sequence BandIncrement;

create table tblBandTheme(
Themenr REFERENCES tblTheme(Themenr) not null,
Bandnr REFERENCES tblband(Bandnr) not null
);

create table tblGenreLine(
Genrenr REFERENCES tblGenre(Genrenr) not null,
Bandnr REFERENCES tblband(Bandnr),
Labelnr REFERENCES tblLabel(Labelnr)
);

create table tblAlbum(
Albumnr number primary key not null,
Labelnr REFERENCES tblLabel(labelnr) not null,
Bandnr REFERENCES tblBand(Bandnr) not null,
Usernr REFERENCES tblUser(Usernr) not null,
AlbumName nvarchar2(20),
AlbumType nvarchar2(20),
ReleaseDate date,
CatalogID nvarchar2(20),
Format nvarchar2(20),
Limitation number(10),
CreationDate date
);
create sequence ALbumIncrement;

create table tblLineUp(
Artistnr REFERENCES tblArtist(Artistnr) not null,
Albumnr REFERENCES tblAlbum(Albumnr) not null,
Bandnr REFERENCES tblBand(Bandnr)not null,
Rolenr REFERENCES tblRole(Rolenr)not null,
constraint pkLineup primary key (Artistnr,Albumnr,Bandnr,Rolenr)
);

create table tblSong(
Songnr number primary key not null,
Albumnr REFERENCES tblAlbum(Albumnr) not null,
Nr number(2),
SongName nvarchar2(30),
SongDuration nvarchar2(6),
Lyrics nvarchar2(2000)
);
create sequence SongIncrement;

create table tblLinks(
linknr number primary key not null,
Artistnr REFERENCES tblArtist(Artistnr),
Bandnr REFERENCES tblBand(Bandnr),
Labelnr REFERENCES tblLabel(Labelnr),
NewsID REFERENCES tblNews(NewsID),
Url nvarchar2(2000) 
);
create sequence LinksIncrement;

create table tblReview(
Reviewnr number primary key not null,
Albumnr REFERENCES tblAlbum(Albumnr) not null,
Usernr REFERENCES tblUser(Usernr) not null,
Rating number(2),
ReviewDate date,
ReviewName nvarchar2(200),
Text nvarchar2(2000),
CreationDate date
);
create sequence ReviewIncrement;

create table tblPost(
Postnr number primary key not null,
Discussionnr REFERENCES tblDiscussion(Discussionnr) not null,
Usernr REFERENCES tblUser(Usernr) not null,
Text nvarchar2(2000),
CreationDate Date
);
create sequence PostIncrement;

create table tblPage(
PageID number primary key not null,
PageName nvarchar2(30) not null,
Url nvarchar2(2000) not null
);
create sequence PageIncrement;

create table tblMenu(
MenuID number primary key not null,
ParentID REFERENCES tblMenu(MenuID),
PageID REFERENCES tblPage(PageID)
);
create sequence MenuIncrement;

--- Auto increment ---

CREATE OR REPLACE TRIGGER GenreT
BEFORE INSERT ON tblGenre
FOR EACH ROW
BEGIN
:new.Genrenr := GenreIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER ThemeT
BEFORE INSERT ON tblTheme
FOR EACH ROW
BEGIN
:new.Themenr := ThemeIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER UserT
BEFORE INSERT ON tblUser
FOR EACH ROW
BEGIN
:new.Usernr := UserIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER ArtistT
BEFORE INSERT ON tblArtist
FOR EACH ROW
BEGIN
:new.Artistnr := ArtistIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER NewsT
BEFORE INSERT ON tblNews
FOR EACH ROW
BEGIN
:new.NewsID := NewsIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER RoleT
BEFORE INSERT ON tblRole
FOR EACH ROW
BEGIN
:new.Rolenr := RoleIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER DiscussionT
BEFORE INSERT ON tblDiscussion
FOR EACH ROW
BEGIN
:new.Discussionnr := DiscussionIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER LabelT
BEFORE INSERT ON tblLabel
FOR EACH ROW
BEGIN
:new.Labelnr := LabelIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER BandT
BEFORE INSERT ON tblBand
FOR EACH ROW
BEGIN
:new.Bandnr := BandIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER AlbumT
BEFORE INSERT ON tblAlbum
FOR EACH ROW
BEGIN
:new.Albumnr := AlbumIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER SongT
BEFORE INSERT ON tblSong
FOR EACH ROW
BEGIN
:new.Songnr := SongIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER LinkT
BEFORE INSERT ON tblLinks
FOR EACH ROW
BEGIN
:new.Linknr := LinksIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER ReviewT
BEFORE INSERT ON tblReview
FOR EACH ROW
BEGIN
:new.Reviewnr := ReviewIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PostT
BEFORE INSERT ON tblPost
FOR EACH ROW
BEGIN
:new.Postnr := PostIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PageT
BEFORE INSERT ON tblPage
FOR EACH ROW
BEGIN
:new.PageID := PageIncrement.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER MenuT
BEFORE INSERT ON tblMenu
FOR EACH ROW
BEGIN
:new.MenuID := MenuIncrement.NEXTVAL;
END;
/

--- population --
INSERT INTO tblGenre (GenreName) VALUES ('Folk');
INSERT INTO tblGenre (GenreName) VALUES ('Melodic');
INSERT INTO tblGenre (GenreName) VALUES ('Black');
INSERT INTO tblGenre (GenreName) VALUES ('Thrash');
INSERT INTO tblGenre (GenreName) VALUES ('Heavy');
INSERT INTO tblGenre (GenreName) VALUES ('Viking');
INSERT INTO tblGenre (GenreName) VALUES ('Ambient');

INSERT INTO tblTheme (ThemeName) VALUES ('Folklore');
INSERT INTO tblTheme (ThemeName) VALUES ('Philosophy');
INSERT INTO tblTheme (ThemeName) VALUES ('War');
INSERT INTO tblTheme (ThemeName) VALUES ('Darkness');
INSERT INTO tblTheme (ThemeName) VALUES ('Death');
INSERT INTO tblTheme (ThemeName) VALUES ('Satanism');
INSERT INTO tblTheme (ThemeName) VALUES ('Myths');
INSERT INTO tblTheme (ThemeName) VALUES ('Anti-Religion');
INSERT INTO tblTheme (ThemeName) VALUES ('Politics');


INSERT INTO tbluser (username,fullname,age,gender,country,pass,creationdate,points) 
VALUES ('Jörmungandr','Jorrit Verstijlen',20,'Male','Nederland','Password123','6-APR-2016',1000);
INSERT INTO tbluser (username,fullname,age,gender,country,pass,creationdate,points) 
VALUES ('MetalHans','Hans Worst',20,'Male','Germany','Password123','1-APR-2016',150);
INSERT INTO tbluser (username,fullname,age,gender,country,pass,creationdate,points) 
VALUES ('KaasIsDeBaas','Eva Kaas',20,'Female','Norway','Password123','5-DEC-2015',500);

INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (2,'Hoest','Ørjan Stedjeberg',38,'Male','24-SEP-1977','Norway', 'lang verhaal', 'blabla','9-APR-2016');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,DeathDate,DiedOf,Origin,biography,trivia,creationdate) 
VALUES (1,'Dead','Per Yngve Ohlin',22,'Male','16-JAN-1977','8-APR-1991','Suicide by gunshot','Norway', 'lang verhaal', 'blabla','1-JAN-2010');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (1,'Varg Vikernes','Kristian Vikernes',43,'Male','11-FEB-1973','Norway', 'lang verhaal', 'blabla','22-AUG-2007');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (3,'Grutle Kjellson','Kjetil Tvedte Grutle',42,'Male','24-DEC-1973','Norway', 'lang verhaal', 'blabla','4-DEC-2014');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (2,'Ventor','Jürgen Reil',49,'Male','29-JUN-1966','Germany','lang verhaal','blabla','9-APR-2009');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (2,'Mille Petrozza','Miland Petrozza',48,'Male','18-DEC-1967','Germany','lang verhaal','blabla','9-APR-2009');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (2,'Christian "Speesy" Giesler','Christian Giesler',45,'Male','4-Jul-1970','Germany','lang verhaal','blabla','9-APR-2009');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (2,'Sami Yli-Sirniö','Sami Yli-Sirniö',44,'Male','10-APR-1972','Finland','lang verhaal','blabla','9-APR-2009');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (1,'Fenriz','Gylve Fenris Nagell',44,'Male','28-NOV-1971','Norway','lang verhaal','blabla','9-APR-2011');
INSERT INTO tblArtist(usernr,stagename,fullname,age,gender,BirthDate,Origin,biography,trivia,creationdate) 
VALUES (1,'Nocturno Culto','Ted Arvid Skjellum',44,'Male','4-Mar-1971','Norway','lang verhaal','blabla','9-APR-2011');



INSERT INTO tblNews(Title,text,datetime) 
VALUES ('Concert','blabla nieuw concert','9-APR-2016');

INSERT INTO tblrole(ArtistRole) VALUES ('Guitar');
INSERT INTO tblrole(ArtistRole) VALUES ('Vocal');
INSERT INTO tblrole(ArtistRole) VALUES ('Bass');
INSERT INTO tblrole(ArtistRole) VALUES ('Drums');
INSERT INTO tblrole(ArtistRole) VALUES ('keyboard');


INSERT INTO tblDiscussion(usernr,discussionname) VALUES (1,'Looking for new bands');
INSERT INTO tblDiscussion(usernr,discussionname) VALUES (2,'Upcomming concerts');
INSERT INTO tblDiscussion(usernr,discussionname) VALUES (3,'Favorite bands?');

INSERT INTO tblLabel(usernr,labelname,adress,country,phonenumber,status,foundingdate,description,onlineshopping,creationdate)
VALUES (3,'Nuclear blast records','Oeschstr. 40 73072 Donzdorf','Germany','0049716292800','Active','1-Jan-1987','Blabla','Yes','1-Jan-2007');
INSERT INTO tblLabel(usernr,labelname,adress,country,status,foundingdate,description,onlineshopping,creationdate)
VALUES (2,'Metalblade records','5737 Kanan Road 143 Agoura Hills, California 91301f','United States','Active','1-FEB-1982','Blabla','Yes','1-Jan-2001');

INSERT INTO tblBand(labelnr,usernr,Bandname,Origin,Place,Status,Formed,YearsActive,Description,CreationDate,logo)
VALUES(1,1,'Burzum','Norway','Bergen','Active','1-Jan-1991','1991 - present','BlaBla','16-JUN-2007','http://www.metal-archives.com/images/8/8/88_logo.jpg?3301');
INSERT INTO tblBand(labelnr,usernr,Bandname,Origin,Place,Status,Formed,YearsActive,Description,CreationDate,logo)
VALUES(1,1,'Mayhem','Norway','Bergen','Active','1-Jan-1991','1984 - present','BlaBla','15-JUN-2007','http://www.metal-archives.com/images/6/7/67_logo.png?0417');
INSERT INTO tblBand(labelnr,usernr,Bandname,Origin,Place,Status,Formed,YearsActive,Description,CreationDate)
VALUES(2,3,'Darkthrone','Norway','Bergen','Active','1-Jan-1987','1987 - present','BlaBla','17-AUG-2002');
INSERT INTO tblBand(labelnr,usernr,Bandname,Origin,Place,Status,Formed,YearsActive,Description,CreationDate,logo)
VALUES(2,3,'Kreator','Germany','Essen','Active','1-Jan-1984','1984 - present','BlaBla','17-AUG-2002','http://www.metal-archives.com/images/1/5/7/157_logo.png?3933');

INSERT INTO tblGenreLine(genrenr, Bandnr) VALUES (3,1);
INSERT INTO tblGenreLine(genrenr, Bandnr) VALUES (7,1);
INSERT INTO tblGenreLine(genrenr, Bandnr) VALUES (3,2);
INSERT INTO tblGenreLine(genrenr, Bandnr) VALUES (4,4);

INSERT INTO tblGenreLine(genrenr, Labelnr) VALUES (3,1);
INSERT INTO tblGenreLine(genrenr, Labelnr) VALUES (4,1);
INSERT INTO tblGenreLine(genrenr, Labelnr) VALUES (5,1);
INSERT INTO tblGenreLine(genrenr, Labelnr) VALUES (6,1);
INSERT INTO tblGenreLine(genrenr, Labelnr) VALUES (5,2);


INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (1,1);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (1,7);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (1,4);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (1,2);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (2,3);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (2,6);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (2,8);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (3,3);
INSERT INTO tblBandTheme(Bandnr, themenr) VALUES (3,4);

INSERT INTO tblAlbum(labelnr,usernr,Bandnr,AlbumName,AlbumType,ReleaseDate,Format,Limitation,CreationDate)
VALUES(1,1,1,'Det som engang var','Full-length','6-JUN-1995','CD','950','20-JAN-2004');
INSERT INTO tblAlbum(labelnr,usernr,Bandnr,AlbumName,AlbumType,ReleaseDate,Format,CreationDate)
VALUES(2,2,3,'Panzerfaust','Full-length','6-JUN-1995','CD','21-JAN-2005');
INSERT INTO tblAlbum(labelnr,usernr,Bandnr,AlbumName,AlbumType,ReleaseDate,Format,CreationDate)
VALUES(1,3,4,'Pleasure to Kill','Full-length','6-JUN-1995','CD','21-JAN-2005');

INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(3,1,1,1);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(1,1,1,2); --3
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(3,1,1,3);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(3,1,1,4);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(10,2,3,2);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(9,2,3,4);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(9,2,3,1);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(9,2,3,3);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(9,2,3,5);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(5,3,4,1);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(6,3,4,2);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(7,3,4,3);
INSERT INTO tblLineup(artistnr,albumnr,bandnr,rolenr) VALUES(8,3,4,4);

INSERT INTO tblsong(albumnr,nr,Songname,SongDuration,Lyrics)
VALUES(1,1,'Den onde kysten','02:20','instrumental');
INSERT INTO tblsong(albumnr,nr,Songname,SongDuration,Lyrics)
VALUES(1,2,'Key to the Gate','05:10','Blabla');

INSERT INTO tbllinks(artistnr,Url) Values(1,'https://www.facebook.com/hoest.fan.page');
INSERT INTO tbllinks(artistnr,Url) Values(3,'https://thuleanperspective.com/');
INSERT INTO tbllinks(artistnr,Url) Values(3,'https://myfarog.org/');
INSERT INTO tbllinks(Labelnr,Url) Values(1,'http://www.nuclearblast.de/en/');
INSERT INTO tbllinks(Bandnr,Url) Values(1,'http://www.burzum.org/');

INSERT INTO tblreview(albumnr,usernr,Rating,ReviewDate,ReviewName,Text,CreationDate)
VALUES(1,1,10,'9-APR-2016','Dark, ambient, and beautiful','blabla','28-APR-2004');
INSERT INTO tblreview(albumnr,usernr,Rating,ReviewDate,ReviewName,Text,CreationDate)
VALUES(2,2,7,'9-APR-2016','Very good album','blabla','28-APR-2004');

INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,2,'I know many good bands','9-APR-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,1,'Which ones do you suggest?','9-APR-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,3,'Kreator','9-APR-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,2,'Slayer','9-FEB-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,1,'Thanks','9-JAN-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(2,1,'Graspop 12 juli 2016','9-JAN-2016');
INSERT INTO tblPost(discussionnr,usernr,Text,CreationDate) VALUES(1,1,'Deze post is van 2015','9-JAN-2015');

INSERT INTO tblPage(pagename,url) VALUES('MainPage','http://www.metal-archives.com/');
INSERT INTO tblPage(pagename,url) VALUES('Help','http://www.metal-archives.com/content/help');
INSERT INTO tblPage(pagename,url) VALUES('Rules','http://www.metal-archives.com/content/rules');
INSERT INTO tblPage(pagename,url) VALUES('HelpSubMenu','http://www.metal-archives.com/content/help');

INSERT INTO tblMenu(pageid) VALUES(1);
INSERT INTO tblMenu(parentid,pageid) VALUES(1,2);
INSERT INTO tblMenu(parentid,pageid) VALUES(1,3);
INSERT INTO tblMenu(parentid,pageid) VALUES(2,4);

select distinct g.genrename from tblgenre g 
join tblgenreline gl ON g.genrenr = gl.genrenr 
join tblband b on gl.bandnr = b.bandnr
where b.bandname = 'Burzum';

select Albumname,AlbumType,ReleaseDate from tblAlbum Where bandnr = (select bandnr from tblband Where bandname = 'Kreator')