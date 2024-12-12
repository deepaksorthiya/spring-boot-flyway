create table app_users
(
    user_id    bigint       not null,
    email      varchar(255) not null,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    password   varchar(255),
    primary key (user_id),
    constraint UQ_APP_USERS_EMAIL unique (email)
);

create table roles
(
    role_id   bigint not null,
    role_desc varchar(255),
    role_name varchar(255),
    primary key (role_id),
    constraint UQ_ROLES_ROLE_NAME unique (role_name)
);

create table app_users_roles_mapping
(
    role_id bigint not null,
    user_id bigint not null,
    constraint UQ_APP_USERS_ROLES_MAPPING_APP_USER_ID_ROLE_ID primary key (user_id, role_id),
    constraint FK_APP_USERS_ROLES_MAPPING_ROLES_ROLE_ID foreign key (role_id) references roles (role_id),
    constraint FK_APP_USERS_ROLES_MAPPING_APP_USERS_USER_ID foreign key (user_id) references app_users (user_id)
);

create sequence app_users_seq start with 1 increment by 50;
create sequence roles_seq start with 1 increment by 50;