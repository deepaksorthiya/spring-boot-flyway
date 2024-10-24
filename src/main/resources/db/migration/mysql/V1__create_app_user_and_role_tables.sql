CREATE TABLE app_user
(
    user_id    bigint       NOT NULL AUTO_INCREMENT,
    email      varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name  varchar(255) NOT NULL,
    password   varchar(255) DEFAULT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE role
(
    role_id   bigint NOT NULL AUTO_INCREMENT,
    role_desc varchar(255) DEFAULT NULL,
    role_name varchar(255) DEFAULT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE app_user_role_mapping
(
    id      bigint NOT NULL AUTO_INCREMENT,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT UNIQUE_app_user_role_mapping_user_id_role_id UNIQUE (user_id, role_id),
    CONSTRAINT FK_app_user_role_mapping_app_user_id FOREIGN KEY (user_id) REFERENCES app_user (user_id),
    CONSTRAINT FK_app_user_role_mapping_role_id FOREIGN KEY (role_id) REFERENCES role (role_id)
);