SELECT artists.artist_name AS artista,
albuns.album_name AS album,
COUNT(followers.artist_id) AS seguidores
FROM SpotifyClone.albuns AS albuns
INNER JOIN SpotifyClone.artists AS artists
ON albuns.album_artist = artists.artist_id
INNER JOIN SpotifyClone.followers AS followers
ON albuns.album_artist = followers.artist_id
GROUP BY artists.artist_name, albuns.album_name, followers.artist_id
ORDER BY COUNT(followers.artist_id) DESC, artists.artist_name ASC, albuns.album_name ASC;