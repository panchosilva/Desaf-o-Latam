--desafio 3
select subquery.titulo_cancion
from (
select nombre_artista, nacionalidad, titulo_cancion, numero_del_track
from artista
left join
cancion on artista.nombre_artista = cancion.artista 
where nacionalidad = 'Estadounidense' and fecha_de_nacimiento > '1992-12-31'
limit 1
) as subquery
where subquery.numero_del_track = 4;