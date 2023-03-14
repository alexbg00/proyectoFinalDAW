CREATE DATABASE IF NOT EXISTS laravel_PicturePost
use laravel_PicturePost

CREATE TABLE IF NOT EXISTS users (
    id int(255) auto_increment not null,
    role varchar(255),
    name varchar(255),
    surname varchar(255),
    nick varchar(255),
    email varchar(255),
    password varchar(255),
    image varchar(255),
    create_at datetime,
    update_at datetime,
    rember_token varchar(255),
    CONSTRAINT pk_users PRIMARY KEY (id)
) ENGINE=InnoDB  ;

INSERT INTO users VALUES(NULL, 'user', 'Alejandro', 'Barrionuevo', 'ale00', 'ale888@hotmail.es','pass',null, curtime(), curtime(), null);

CREATE TABLE IF NOT EXISTS images (
    id int(255) auto_increment not null,
    user_id int(255),
    image_path varchar(255),
    description text,
    create_at datetime,
    update_at datetime,
    CONSTRAINT pk_images PRIMARY KEY (id),
    CONSTRAINT fk_images_users FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB ;

INSERT INTO images VALUES(NULL, 1, 'images/imagen1.jpg', 'imagen 1', curtime(), curtime());


CREATE TABLE IF NOT EXISTS comments (
    id int(255) auto_increment not null,
    user_id int(255),
    image_id int(255),
    content text,
    create_at datetime,
    update_at datetime,
    CONSTRAINT pk_comments PRIMARY KEY (id),
    CONSTRAINT fk_comments_users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_comments_images FOREIGN KEY (image_id) REFERENCES images(id)
) ENGINE=InnoDB ;

INSERT INTO comments VALUES(NULL, 1, 1, 'comentario 1', curtime(), curtime());

CREATE TABLE IF NOT EXISTS likes (
    id int(255) auto_increment not null,
    user_id int(255),
    image_id int(255),
    create_at datetime,
    update_at datetime,
    CONSTRAINT pk_likes PRIMARY KEY (id),
    CONSTRAINT fk_likes_users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_likes_images FOREIGN KEY (image_id) REFERENCES images(id)
) ENGINE=InnoDB ;

INSERT INTO likes VALUES(NULL, 1, 1, curtime(), curtime());
