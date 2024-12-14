create table app_users
(
    user_id    bigint       not null,
    email      varchar(255) not null,
    password   varchar(255),
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    primary key (user_id),
    constraint UQ_app_users_email unique (email)
) engine=InnoDB;

create table roles
(
    role_id   bigint not null,
    role_name varchar(255),
    role_desc varchar(255),
    primary key (role_id),
    constraint UQ_roles_role_name unique (role_name)
) engine=InnoDB;

create table app_users_roles_mapping
(
    user_id bigint not null,
    role_id bigint not null,
    constraint UQ_app_users_roles_mapping_user_id_role_id primary key (user_id, role_id),
    constraint FK_app_users_roles_mapping_user_id_app_users_user_id foreign key (user_id) references app_users (user_id),
    constraint FK_app_users_roles_mapping_role_id_roles_role_id foreign key (role_id) references roles (role_id)
) engine=InnoDB;

create table app_users_seq
(
    next_val bigint
) engine=InnoDB;

insert into app_users_seq
values (1);

create table roles_seq
(
    next_val bigint
) engine=InnoDB;

insert into roles_seq
values (1);