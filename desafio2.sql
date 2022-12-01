SELECT COUNT(*) AS cancoes,
(SELECT COUNT(artist_name) FROM SpotifyClone.artists) AS artistas,
(SELECT COUNT(album_name) FROM SpotifyClone.albuns) AS albuns
FROM SpotifyClone.musics;