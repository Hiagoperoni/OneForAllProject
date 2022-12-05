SELECT artists.artist_name AS artista,
albuns.album_name AS album
FROM SpotifyClone.albuns AS albuns
INNER JOIN SpotifyClone.artists AS artists
ON albuns.album_artist = artists.artist_id;