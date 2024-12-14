create table permissions
(
    permission_id   bigint not null,
    permission_name varchar(255),
    permission_desc varchar(255),
    primary key (permission_id),
    constraint UQ_permissions_permission_name unique (permission_name)
);

create table roles_permissions_mapping
(
    role_id       bigint not null,
    permission_id bigint not null,
    constraint UQ_roles_permissions_mapping_role_id_permission_id primary key (role_id, permission_id),
    constraint FK_roles_permissions_mapping_role_id_roles_role_id foreign key (role_id) references roles (role_id),
    constraint FK_roles_permissions_mapping_permission_id_permissions_permission_id foreign key (permission_id) references permissions (permission_id)
);

create sequence permissions_seq start with 1 increment by 50;