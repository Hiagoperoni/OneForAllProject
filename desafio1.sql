DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
	plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(15) NOT NULL,
    plan_price DOUBLE NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (plan_id, plan_name, plan_price)
VALUES
	(1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitario', 5.99),
    (4, 'pessoal', 6.99);

CREATE TABLE SpotifyClone.artists(
	artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(20) NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.artists (artist_id, artist_name)
VALUES
	(1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

CREATE TABLE SpotifyClone.users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(40) NOT NULL,
    user_age INT NOT NULL,
    user_plan INTEGER,
    FOREIGN KEY (user_plan) REFERENCES SpotifyClone.plans(plan_id),
    user_signature DATE
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.users (user_id, user_name, user_age, user_plan, user_signature)
VALUES
	(1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9, 'Judith Butler', 45, 4, '2020-05-13'),
    (10, 'Jorge Amado', 58, 4, '2017-02-17');
    
CREATE TABLE SpotifyClone.followers(
	user_id INTEGER,
    artist_id INTEGER,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
		FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
		FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) ENGINE = InnoDB;
 
INSERT INTO SpotifyClone.followers (user_id, artist_id)
VALUES 
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

CREATE TABLE SpotifyClone.albuns(
	album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(30) NOT NULL,
    album_artist INTEGER,
    FOREIGN KEY (album_artist) REFERENCES SpotifyClone.artists(artist_id),
    album_release INT NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.albuns (album_id, album_name, album_artist, album_release)
VALUES
	(1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.musics(
	music_id INT AUTO_INCREMENT  PRIMARY KEY,
    music_name VARCHAR(50) NOT NULL,
    music_artist INTEGER,
    FOREIGN KEY (music_artist) REFERENCES SpotifyClone.artists(artist_id),
    music_album INTEGER,
    FOREIGN KEY (music_album) REFERENCES SpotifyClone.albuns(album_id),
    music_duration INT NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.musics (music_id, music_name, music_artist, music_album, music_duration)
VALUES 
	(1, 'BREAK MY SOUL', 1, 1, 279),
    (2, 'VIRGO’S GROOVE', 1, 1, 369),
    (3, 'ALIEN SUPERSTAR', 1, 1, 116),
    (4, 'Don’t Stop Me Now', 2, 2, 203),
    (5, 'Under Pressure', 2, 3, 152),
    (6, 'Como Nossos Pais', 3, 4, 105),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    (8, 'Samba em Paris', 4, 6, 267),
    (9, 'The Bard’s Song', 5, 7, 244),
    (10, 'Feeling Good', 6, 8, 100);

CREATE TABLE SpotifyClone.reproductions(
	rep_user INTEGER,
    rep_music INTEGER,
    CONSTRAINT PRIMARY KEY(rep_user, rep_music),
    FOREIGN KEY (rep_user) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (rep_music) REFERENCES SpotifyClone.musics(music_id),
    rep_date DATETIME NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.reproductions (rep_music, rep_user, rep_date)
VALUES
	(8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');
