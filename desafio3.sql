SELECT users.user_name AS usuario,
COUNT(rep.rep_music) AS qt_de_musicas_ouvidas,
ROUND((SUM(musics.music_duration) / 60), 2) AS total_minutos
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.reproductions AS rep
ON rep.rep_user = users.user_id
INNER JOIN SpotifyClone.musics AS musics
ON rep.rep_music = musics.music_id
GROUP BY user_name
ORDER BY user_name;