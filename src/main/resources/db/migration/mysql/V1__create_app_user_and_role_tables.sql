create table app_users
(
    user_id    bigint       not null,
    email      varchar(255) not null,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    password   varchar(255),
    primary key (user_id),
    constraint UQ_APP_USERS_EMAIL unique (email)
) engine=InnoDB;

create table roles
(
    role_id   bigint not null,
    role_desc varchar(255),
    role_name varchar(255),
    primary key (role_id),
    constraint UQ_ROLES_ROLE_NAME unique (role_name)
) engine=InnoDB;

create table app_users_roles_mapping
(
    role_id bigint not null,
    user_id bigint not null,
    constraint UQ_APP_USERS_ROLES_MAPPING_APP_USER_ID_ROLE_ID primary key (user_id, role_id),
    constraint FK_APP_USERS_ROLES_MAPPING_ROLES_ROLE_ID foreign key (role_id) references roles (role_id),
    constraint FK_APP_USERS_ROLES_MAPPING_APP_USERS_USER_ID foreign key (user_id) references app_users (user_id)
) engine=InnoDB;

create table app_users_seq (next_val bigint) engine=InnoDB;
insert into app_users_seq values (1);
create table roles_seq (next_val bigint) engine=InnoDB;
insert into roles_seq values (1);