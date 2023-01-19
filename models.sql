CREATE TABLE IF NOT EXISTS users_go (
                                     id serial NOT NULL,
                                     first_name VARCHAR(150) NOT NULL,
                                     last_name VARCHAR(150) NOT NULL,
                                     username VARCHAR(150) NOT NULL UNIQUE,
                                     password varchar(256) NOT NULL,
                                     email VARCHAR(150) NOT NULL UNIQUE,
                                     picture VARCHAR(256) NOT NULL,
                                     created_at timestamp DEFAULT now(),
                                     updated_at timestamp NOT NULL,
                                     CONSTRAINT pk_users_go PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS posts (
                                     id serial NOT NULL,
                                     user_id int NOT NULL,
                                     body text NOT NULL,
                                     created_at timestamp DEFAULT now(),
                                     updated_at timestamp NOT NULL,
                                     CONSTRAINT pk_notes PRIMARY KEY(id),
                                     CONSTRAINT fk_posts_users_go FOREIGN KEY(user_id) REFERENCES users_go(id)
);