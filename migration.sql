USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    price decimal(4,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE categories(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category_id int UNSIGNED NOT NULL,
  category_name VARCHAR (250) not null,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES ads(id) on DELETE CASCADE
);

CREATE table pivot_categories (
  ads_id int unsigned not null,
  categories_id int unsigned not null,
  foreign key (ads_id) references ads(id),
  foreign key (categories_id) references categories(id)
);

CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  location varchar(250),
  PRIMARY KEY (id)
);

CREATE TABLE pivot_media(
  media_id int unsigned not null,
  ad_id int unsigned not null,
  foreign key (media_id) references media(id),
  foreign key (ad_id) references ads(id)
);


