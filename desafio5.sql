SELECT music.music_name AS cancao,
COUNT(rep.rep_music) AS reproducoes
FROM SpotifyClone.musics AS music
INNER JOIN SpotifyClone.reproductions AS rep
ON rep.rep_music = music.music_id
GROUP BY rep_music
ORDER BY COUNT(rep_music) DESC, music_name ASC LIMIT 2;