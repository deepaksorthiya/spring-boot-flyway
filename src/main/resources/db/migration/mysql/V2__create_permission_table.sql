CREATE TABLE permission
(
    permission_id   bigint NOT NULL AUTO_INCREMENT,
    permission_desc varchar(255) DEFAULT NULL,
    permission_name varchar(255) DEFAULT NULL,
    PRIMARY KEY (permission_id)
);

CREATE TABLE role_permission_mapping
(
    id            bigint NOT NULL AUTO_INCREMENT,
    permission_id bigint NOT NULL,
    role_id       bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT UNIQUE_role_permission_mapping_permission_id_role_id UNIQUE (permission_id, role_id),
    CONSTRAINT FK_role_permission_mapping_role_id FOREIGN KEY (role_id) REFERENCES role (role_id),
    CONSTRAINT FK_role_permission_mapping_permission_id FOREIGN KEY (permission_id) REFERENCES permission (permission_id)
);