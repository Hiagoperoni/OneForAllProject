DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Plans(
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(15) NOT NULL,
    plan_price DOUBLE NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Plans (plan_id, plan_name, plan_price)
VALUES
	(1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitario', 5.99),
    (4, 'pessoal', 6.99);

CREATE TABLE SpotifyClone.Artists(
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(20) NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Artists (artist_id, artist_name)
VALUES
	(1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

CREATE TABLE SpotifyClone.Users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(40) NOT NULL,
    user_age INT NOT NULL,
    user_plan INT NOT NULL,
    FOREIGN KEY (user_plan) REFERENCES Plans (plan_id),
    user_signature DATE
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Users (user_id, user_name, user_age, user_plan, user_signature)
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

CREATE TABLE SpotifyClone.Albuns(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(30) NOT NULL,
    album_artist INT NOT NULL,
    FOREIGN KEY (album_artist) REFERENCES Artists (artist_id),
    album_release INT NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Albuns (album_id, album_name, album_artist, album_release)
VALUES
	(1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.Musics(
	music_id INT PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(50) NOT NULL,
    music_artist INT NOT NULL,
    FOREIGN KEY (music_artist) REFERENCES Artists (artist_id),
    music_album INT NOT NULL,
    FOREIGN KEY (music_album) REFERENCES Albuns (album_id),
    music_duration INT NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Musics (music_id, music_name, music_artist, music_album, music_duration)
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

CREATE TABLE SpotifyClone.Reproductions(
	rep_id INT PRIMARY KEY NOT NULL,
    rep_music INT NOT NULL,
    FOREIGN KEY (rep_music) REFERENCES Musics (music_id),
    rep_user INT NOT NULL,
    FOREIGN KEY (rep_user) REFERENCES Users (user_id),
    rep_date DATETIME NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Reproductions (rep_id, rep_music, rep_user, rep_date)
VALUES
	(1, 8, 1, '2022-02-28 10:45:55'),
    (2, 2, 1, '2020-05-02 05:30:35'),
    (3, 10, 1, '2020-03-06 11:22:33'),
    (4, 10, 2, '2022-08-05 08:05:17'),
    (5, 7, 2, '2020-01-02 07:40:33'),
    (6, 10, 3, '2020-11-13 16:55:13'),
    (7, 2, 3, '2020-12-05 18:38:30'),
    (8, 8, 4, '2021-08-15 17:10:10'),
    (9, 8, 5, '2022-01-09 01:44:33'),
    (10, 5, 5, '2020-08-06 15:23:43'),
    (11, 7, 6, '2017-01-24 00:31:17'),
    (12, 1, 6, '2017-10-12 12:35:20'),
    (13, 4, 7, '2011-12-15 22:30:49'),
    (14, 4, 8, '2012-03-17 14:56:41'),
    (15, 9, 9, '2022-02-24 21:14:22'),
    (16, 3, 10, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.Following(
	follow_id INT PRIMARY KEY AUTO_INCREMENT,
    follow_user INT NOT NULL,
    FOREIGN KEY (follow_user) REFERENCES Users (user_id),
    follow_artist INT NOT NULL,
    FOREIGN KEY (follow_artist) REFERENCES Artists (artist_id)
) ENGINE = InnoDB;
 
INSERT INTO SpotifyClone.Following (follow_id, follow_user, follow_artist)
VALUES 
	(1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 1),
    (5, 2, 3),
    (6, 3, 2),
    (7, 4, 4),
    (8, 5, 5),
    (9, 5, 6),
    (10, 6, 6),
    (11, 6, 1),
    (12, 7, 6),
    (13, 9, 3),
    (14, 10, 2);
