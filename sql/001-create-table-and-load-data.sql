DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id int unsigned AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  director VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

INSERT INTO movies (name, director) VALUES ("となりのトトロ","宮崎駿");
INSERT INTO movies (name, director) VALUES ("耳をすばせば","近藤喜文");
INSERT INTO movies (name, director) VALUES ("おもひでぽろぽろ","高畑勲");
INSERT INTO movies (name, director) VALUES ("かぐや姫の物語","高畑勲");
