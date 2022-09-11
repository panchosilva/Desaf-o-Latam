-- Ejercicio 1 (Creación de base stotify)
create database spotify;
---tabla artista
create table artista(
nombre_artista VARCHAR(50) not null constraint pk_artista primary key,
fecha_de_nacimiento date not null,
nacionalidad VARCHAR(50) not null
);
--tabla album
create table album(
titulo_album varchar(50) not null constraint pk_album PRIMARY KEY,
artista varchar(50) not null references artista(nombre_artista),
anio int not null
);
--tabla cancion
create table cancion(
titulo_cancion VARCHAR(50) not null constraint pk_cancion primary KEY,
artista varchar(50) not null references artista(nombre_artista),
album varchar(50) not null references album(titulo_album),
numero_del_track int not null
);

--ingresar datos artista
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Dua Lipa', '22/08/1995', 'Británica');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Ariana Grande', '26/06/1993', 'Estadounidense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Cardi B', '11/10/199', 'Estadounidense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Taylor Swift', '12/12/1989', 'Estadounidense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Camila Cabello', '03/03/1997', 'Cubana');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Drake', '24/10/1986', 'Canadiense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Post Malone', '04/07/1995', 'Estadounidense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('XXXTENTACION', '23/01/1998', 'Estadounidense');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('J Balvin', '07/05/1985', 'Colombia');
insert into artista (nombre_artista, fecha_de_nacimiento, nacionalidad) values ('Ed Sheeran', '17/02/1991', 'Británica');

--ingresar datos album
insert into album (titulo_album, artista, anio) values ('Dua Lipa', 'Dua Lipa', '2017');
insert into album (titulo_album, artista, anio) values ('Yours Truly', 'Ariana Grande', '2013');
insert into album (titulo_album, artista, anio) values ('My Everything', 'Ariana Grande', '2014');
insert into album (titulo_album, artista, anio) values ('Dangerous Woman', 'Ariana Grande', '2016');
insert into album (titulo_album, artista, anio) values ('Sweetener', 'Ariana Grande', '2018');
insert into album (titulo_album, artista, anio) values ('Invasion of Privacy', 'Cardi B', '2018');
insert into album (titulo_album, artista, anio) values ('Taylor Swift', 'Taylor Swift', '2006');
insert into album (titulo_album, artista, anio) values ('Fearless', 'Taylor Swift', '2008');
insert into album (titulo_album, artista, anio) values ('Speak Now', 'Taylor Swift', '2010');
insert into album (titulo_album, artista, anio) values ('Red', 'Taylor Swift', '2012');
insert into album (titulo_album, artista, anio) values ('1989', 'Taylor Swift', '2014');
insert into album (titulo_album, artista, anio) values ('Reputation', 'Taylor Swift', '2017');
insert into album (titulo_album, artista, anio) values ('Camila', 'Camila Cabello', '2018');
insert into album (titulo_album, artista, anio) values ('Thank Me Later', 'Drake', '2010');
insert into album (titulo_album, artista, anio) values ('Take Care', 'Drake', '2011');
insert into album (titulo_album, artista, anio) values ('Nothing Was The Same', 'Drake', '2013');
insert into album (titulo_album, artista, anio) values ('Views', 'Drake', '2016');
insert into album (titulo_album, artista, anio) values ('Scorpion', 'Drake', '2018');
insert into album (titulo_album, artista, anio) values ('Stoney', 'Post Malone', '2016');
insert into album (titulo_album, artista, anio) values ('Beerbongs & Bentleys', 'Post Malone', '2018');
insert into album (titulo_album, artista, anio) values ('17', 'XXXTENTACION', '2017');
insert into album (titulo_album, artista, anio) values ('?', 'XXXTENTACION', '2018');
insert into album (titulo_album, artista, anio) values ('Skins', 'XXXTENTACION', '2018');
insert into album (titulo_album, artista, anio) values ('Real (Edicion Colombia)', 'J Balvin', '2007');
insert into album (titulo_album, artista, anio) values ('Real (Special Edition)', 'J Balvin', '2009');
insert into album (titulo_album, artista, anio) values ('El Negocio', 'J Balvin', '2011');
insert into album (titulo_album, artista, anio) values ('La Familia', 'J Balvin', '2013');
insert into album (titulo_album, artista, anio) values ('La Familia B Sides', 'J Balvin', '2014');
insert into album (titulo_album, artista, anio) values ('Energia', 'J Balvin', '2016');
insert into album (titulo_album, artista, anio) values ('Vibras', 'J Balvin', '2018');
insert into album (titulo_album, artista, anio) values ('+', 'Ed Sheeran', '2011');
insert into album (titulo_album, artista, anio) values ('x', 'Ed Sheeran', '2014');
insert into album (titulo_album, artista, anio) values ('%', 'Ed Sheeran', '2017');

--insertar datos cancion
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('New Rules', 'Dua Lipa', 'Dua Lipa', '10');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Lost in Your Light', 'Dua Lipa', 'Dua Lipa', '2');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Into You', 'Ariana Grande', 'Dangerous Woman', '4');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Side To Side', 'Ariana Grande', 'Dangerous Woman', '5');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Problem', 'Ariana Grande', 'My Everything', '2');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Break Free', 'Ariana Grande', 'My Everything', '5');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('God Is a Woman', 'Ariana Grande', 'Sweetener', '5');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('I Like It', 'Cardi B', 'Invasion of Privacy', '7');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Bad Blood', 'Taylor Swift', '1989', '8');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Blank Space', 'Taylor Swift', '1989', '2');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('The Story of Us', 'Taylor Swift', 'Speak Now', '4');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Love Story', 'Taylor Swift', 'Fearless', '3');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Havanna', 'Camila Cabello', 'Camila', '4');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('One Dance', 'Drake', 'Views', '12');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Too Much', 'Drake', 'Nothing Was The Same', '12');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Own It', 'Drake', 'Nothing Was The Same', '5');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Broken Whiskey Glass', 'Post Malone', 'Stoney', '1');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Too Young', 'Post Malone', 'Stoney', '11');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('Train food', 'XXXTENTACION', 'Skins', '3');
insert into cancion (titulo_cancion, artista, album, numero_del_track) VALUES ('One Minute', 'XXXTENTACION', 'Skins', '7');

--consulta 1) Canciones que salieron el año 2018
select cancion.titulo_cancion, album.anio from cancion left join album on cancion.album = album.titulo_album where anio = 2018
--consulta 2) Albums y la nacionalidad de su artista.
select titulo_album, nacionalidad from album left join artista on album.artista = artista.nombre_artista
--consulta 3) (es muy largo para ponerla entera)
select numero_del_track ,titulo_cancion ,album , anio, cancion.artista from cancion left join album on cancion.album = album.titulo_album