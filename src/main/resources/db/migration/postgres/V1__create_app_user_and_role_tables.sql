create table app_users
(
    user_id    bigint       not null,
    email      varchar(255) not null,
    password   varchar(255),
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    primary key (user_id),
    constraint UQ_app_users_email unique (email)
);

create table roles
(
    role_id   bigint not null,
    role_name varchar(255),
    role_desc varchar(255),
    primary key (role_id),
    constraint UQ_roles_role_name unique (role_name)
);

create table app_users_roles_mapping
(
    user_id bigint not null,
    role_id bigint not null,
    constraint UQ_app_users_roles_mapping_user_id_role_id primary key (user_id, role_id),
    constraint FK_app_users_roles_mapping_user_id_app_users_user_id foreign key (user_id) references app_users (user_id),
    constraint FK_app_users_roles_mapping_role_id_roles_role_id foreign key (role_id) references roles (role_id)
);

create sequence app_users_seq start with 1 increment by 50;
create sequence roles_seq start with 1 increment by 50;