SELECT 
	users.user_name AS usuario,
	IF (MAX(YEAR(rep.rep_date)) > 2020, 'Usuário ativo', 'Usuário inativo')
AS status_usuario
FROM SpotifyClone.reproductions AS rep
JOIN SpotifyClone.users AS users
ON users.user_id = rep.rep_user
GROUP BY user_name
ORDER BY user_name;