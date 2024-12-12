create table permissions
(
    permission_id   bigint not null,
    permission_desc varchar(255),
    permission_name varchar(255),
    primary key (permission_id),
    constraint UQ_PERMISSIONS_PERMISSION_NAME unique (permission_name)
) engine=InnoDB;

create table roles_permissions_mapping
(
    permission_id bigint not null,
    role_id       bigint not null,
    constraint UQ_ROLES_PERMISSIONS_MAPPING_USER_ID_ROLE_ID primary key (role_id, permission_id),
    constraint FK_ROLES_PERMISSIONS_MAPPING_ROLES_ROLE_ID foreign key (role_id) references roles (role_id),
    constraint FK_ROLES_PERMISSIONS_MAPPING_PERMISSIONS_PERMISSION_ID foreign key (permission_id) references permissions (permission_id)
) engine=InnoDB;

create table permissions_seq (next_val bigint) engine=InnoDB;
insert into permissions_seq values (1);